import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/auth/data/models/user_model.dart';
import 'features/books/data/models/book_model.dart';

import 'features/auth/data/data_sources/auth_service.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'features/books/data/services/book_service.dart';
import 'features/books/data/repositories/book_repository.dart';

import 'features/auth/logic/cubit/auth_cubit.dart';
import 'features/books/logic/cubit/book_cubit.dart';
import 'features/books/logic/cubit/fav_cubit.dart';
import 'features/search/logic/cubit/search_cubit.dart';

import 'core/constants/app_colors.dart';
import 'features/splash/view/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter());
  Hive.registerAdapter(UserModelAdapter());

  final favBox = await Hive.openBox<BookModel>('favorites');
  final authBox = await Hive.openBox<UserModel>('users');

  runApp(MyApp(favBox: favBox, authBox: authBox));
}

class MyApp extends StatelessWidget {
  final Box<BookModel> favBox;
  final Box<UserModel> authBox;

  const MyApp({super.key, required this.favBox, required this.authBox});

  @override
  Widget build(BuildContext context) {
    final bookRepository = BookRepository(BookService(), favBox);

    return MultiBlocProvider(
      providers: [
        // Authentication
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(AuthRepository(AuthService())),
        ),

        // Books
        BlocProvider<BookCubit>(create: (context) => BookCubit(bookRepository)),

        // Favorites
        BlocProvider<FavCubit>(create: (context) => FavCubit(favBox)),

        // Search
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(bookRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Booky',
        theme: ThemeData(fontFamily: 'Roboto', primaryColor: AppColors.primary),
        home: const SplashScreen(),
      ),
    );
  }
}
