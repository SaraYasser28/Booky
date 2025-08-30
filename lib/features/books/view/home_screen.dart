import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/category_list.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../../core/widgets/curved_appbar.dart';
import '../../../core/widgets/button_effect.dart';
import '../data/models/book_model.dart';
import '../logic/cubit/book_cubit.dart';
import '../logic/cubit/book_state.dart';
import '../logic/cubit/fav_cubit.dart';
import '../widgets/book_card.dart';
import '../../categories/widgets/category_card.dart';
import '../../categories/view/category_screen.dart';
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
                      final recentBooks = List<BookModel>.from(state.books)
                        ..sort(
                          (a, b) => b.publishedDate.compareTo(a.publishedDate),
                        );
                      final latestThree = recentBooks.take(3).toList();

                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: latestThree.asMap().entries.map((entry) {
                            final index = entry.key;
                            final book = entry.value;
                            return Expanded(
                              child: BookCard(
                                book: book,
                                textColor: Colors.white,
                                lift: index == 0 || index == 2,
                              ),
                            );
                          }).toList(),
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
                    child: BlocBuilder<FavCubit, List<BookModel>>(
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
                            ...limitedBooks.map(
                              (book) => Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: BookCard(book: book),
                              ),
                            ),
                            if (favBooks.length > 4)
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: TextButton(
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
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                        ),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return CategoryCard(
                        title: category.title,
                        imagePath: category.imagePath,
                        onTap: () {
                          Navigator.push(
                            context,
                            buttonEffectRoute(
                              CategoryScreen(genre: category.apiQuery),
                            ),
                          );
                        },
                      );
                    },
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
