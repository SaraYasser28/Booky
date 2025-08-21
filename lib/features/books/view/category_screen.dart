import 'package:booky_library/core/constants/app_images.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../widgets/book_card.dart';
import '../../../core/widgets/curved_appbar.dart';
import '../../../core/widgets/custom_drawer.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(username: ''),
      body: CustomScrollView(
        slivers: [
          CurvedAppBar(
            title: "Booky",
            subtitle: "Fantasy",
            backgroundImage: AppImages.fantasy,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Books (8)",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),

                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.65,
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
                        title: "Bridge of Clay",
                        author: "Markus Zusak",
                        imagePath: AppImages.bridgeClay,
                      ),
                      BookCard(
                        title: "The Borgias",
                        author: "Christopher Hibbert",
                        imagePath: AppImages.borgias,
                      ),
                      BookCard(
                        title: "A Man Called Ove",
                        author: "Fredrik Backman",
                        imagePath: AppImages.ove,
                      ),
                      BookCard(
                        title: "A Game of Thrones",
                        author: "George R. R. Martin",
                        imagePath: AppImages.gameThrones,
                      ),
                      BookCard(
                        title: "The Wold is Not Enough",
                        author: "Anthony Horowitz",
                        imagePath: AppImages.world,
                      ),
                      BookCard(
                        title: "The Silmarillion",
                        author: "J. R. R. Tolkien",
                        imagePath: AppImages.silmarillion,
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
