import 'package:booky_library/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../../core/widgets/curved_appbar.dart';
import '../widgets/book_card.dart';
import '../widgets/category_card.dart';
import 'category_screen.dart';
import 'my_books.dart';
import '../../../core/widgets/button_effect.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(username: username),
      body: CustomScrollView(
        slivers: [
          CurvedAppBar(
            title: "Booky",
            overlayChild: Column(
              children: [
                const SizedBox(height: 120),
                const Text(
                  "Recently added",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Expanded(
                        child: BookCard(
                          title: "The Lost Child",
                          author: "Patricia Gibney",
                          imagePath: AppImages.lostChild,
                          lift: true,
                          textColor: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: BookCard(
                          title: "A Spark of Light",
                          author: "Jodi Picoult",
                          imagePath: AppImages.spark,
                          textColor: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: BookCard(
                          title: "The Warehouse",
                          author: "Rob Hart",
                          imagePath: AppImages.warehouse,
                          lift: true,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        buttonEffectRoute(const MyBooks()),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "My books (4)",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        BookCard(
                          title: "The Hobbit",
                          author: "J. R. R. Tolkien",
                          imagePath: AppImages.hobbit,
                        ),
                        BookCard(
                          title: "Catching Fire",
                          author: "Suzanne Collins",
                          imagePath: AppImages.catchingFire,
                        ),
                        BookCard(
                          title: "A Man Called Ove",
                          author: "Fredrik Backman",
                          imagePath: AppImages.ove,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyBooks(),
                              ),
                            );
                          },
                          child: const Text(
                            "View All",
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64),
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
                            buttonEffectRoute(const CategoryScreen()),
                          );
                        },
                      ),
                      const CategoryCard(
                        title: "Fiction",
                        imagePath: AppImages.fiction,
                      ),
                      const CategoryCard(
                        title: "Crime",
                        imagePath: AppImages.crime,
                      ),
                      const CategoryCard(
                        title: "Young Adult",
                        imagePath: AppImages.youngAdult,
                      ),
                      const CategoryCard(
                        title: "Horror",
                        imagePath: AppImages.horror,
                      ),
                      const CategoryCard(
                        title: "Romance",
                        imagePath: AppImages.romance,
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
