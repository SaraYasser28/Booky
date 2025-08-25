import 'features/auth/data/data_sources/auth_service.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/app_colors.dart';
import 'features/auth/logic/cubit/auth_cubit.dart';
import 'features/books/data/repositories/book_repository.dart';
import 'features/books/data/services/book_service.dart';
import 'features/books/logic/cubit/book_cubit.dart';
import 'features/books/logic/cubit/fav_cubit.dart';
import 'features/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          create: (context) => BookCubit(BookRepository(BookService())),
        ),

        // Favorites
        BlocProvider<FavCubit>(create: (context) => FavCubit()),
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
