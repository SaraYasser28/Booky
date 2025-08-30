import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../../core/widgets/curved_appbar.dart';
import '../../../core/widgets/button_effect.dart';
import '../logic/cubit/book_cubit.dart';
import '../logic/cubit/book_state.dart';
import '../logic/cubit/fav_cubit.dart';
import '../widgets/book_card.dart';
import '../widgets/category_card.dart';
import 'category_screen.dart';
import 'my_fav.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(username: username),
      body: CustomScrollView(
        slivers: [
          // Recently Added Section
          CurvedAppBar(
            title: "Booky",
            overlayChild: Column(
              children: [
                const SizedBox(height: 120),
                const Text(
                  "Recently Added",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                BlocBuilder<BookCubit, BookState>(
                  builder: (context, state) {
                    if (state is BookLoaded) {
                      final recentBooks = state.books.take(3).toList();
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: recentBooks
                              .map(
                                (book) => Expanded(
                                  child: BookCard(
                                    book: book,
                                    textColor: Colors.white,
                                    lift: true,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      );
                    }
                    if (state is BookLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    }
                    return const Center(
                      child: Text(
                        "No recent books",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // My Favourites Section
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, buttonEffectRoute(const MyFav()));
                    },
                    child: BlocBuilder<FavCubit, List>(
                      builder: (context, favBooks) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "My Favourites (${favBooks.length})",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: BlocBuilder<FavCubit, List>(
                      builder: (context, favBooks) {
                        if (favBooks.isEmpty) {
                          return const Center(
                            child: Text(
                              "No favourites yet",
                              style: TextStyle(color: AppColors.primary),
                            ),
                          );
                        }

                        final limitedBooks = favBooks.take(4).toList();

                        return ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...limitedBooks.map((book) => BookCard(book: book)),
                            if (favBooks.length > 4)
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    buttonEffectRoute(const MyFav()),
                                  );
                                },
                                child: const Text(
                                  "View All",
                                  style: TextStyle(color: AppColors.primary),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 64),

                  // Categories Section
                  const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: [
                      CategoryCard(
                        title: "Fantasy",
                        imagePath: AppImages.fantasy,
                        onTap: () {
                          Navigator.push(
                            context,
                            buttonEffectRoute(
                              const CategoryScreen(genre: "Fantasy"),
                            ),
                          );
                        },
                      ),
                      CategoryCard(
                        title: "Fiction",
                        imagePath: AppImages.fiction,
                        onTap: () {
                          Navigator.push(
                            context,
                            buttonEffectRoute(
                              const CategoryScreen(genre: "Fiction"),
                            ),
                          );
                        },
                      ),
                      CategoryCard(
                        title: "Crime",
                        imagePath: AppImages.crime,
                        onTap: () {
                          Navigator.push(
                            context,
                            buttonEffectRoute(
                              const CategoryScreen(genre: "Crime"),
                            ),
                          );
                        },
                      ),
                      CategoryCard(
                        title: "Young Adult",
                        imagePath: AppImages.youngAdult,
                        onTap: () {
                          Navigator.push(
                            context,
                            buttonEffectRoute(
                              const CategoryScreen(genre: "Young Adult"),
                            ),
                          );
                        },
                      ),
                      CategoryCard(
                        title: "Horror",
                        imagePath: AppImages.horror,
                        onTap: () {
                          Navigator.push(
                            context,
                            buttonEffectRoute(
                              const CategoryScreen(genre: "Horror"),
                            ),
                          );
                        },
                      ),
                      CategoryCard(
                        title: "Romance",
                        imagePath: AppImages.romance,
                        onTap: () {
                          Navigator.push(
                            context,
                            buttonEffectRoute(
                              const CategoryScreen(genre: "Romance"),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
