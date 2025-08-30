import 'package:hive_flutter/hive_flutter.dart';

import 'features/auth/data/data_sources/auth_service.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/app_colors.dart';
import 'features/auth/logic/cubit/auth_cubit.dart';
import 'features/books/data/models/book_model.dart';
import 'features/books/data/repositories/book_repository.dart';
import 'features/books/data/services/book_service.dart';
import 'features/books/logic/cubit/book_cubit.dart';
import 'features/books/logic/cubit/fav_cubit.dart';
import 'features/search/logic/cubit/search_cubit.dart';
import 'features/splash/view/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter());
  final favBox = await Hive.openBox<BookModel>('favorites');
  runApp(MyApp(favBox: favBox));
}

class MyApp extends StatelessWidget {
  final Box<BookModel> favBox;
  const MyApp({super.key, required this.favBox});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Authentication
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(AuthRepository(AuthService())),
        ),

        // Books
        BlocProvider<BookCubit>(
          create: (context) => BookCubit(BookRepository(BookService(), favBox)),
        ),

        // Favorites
        BlocProvider<FavCubit>(create: (context) => FavCubit(favBox)),

        // Search
        BlocProvider(
          create: (_) => SearchCubit(BookRepository(BookService(), favBox)),
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
