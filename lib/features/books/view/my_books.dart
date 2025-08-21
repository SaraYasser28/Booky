import 'package:booky_library/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/book_card.dart';
import '../../../core/widgets/regular_appbar.dart';
import '../../../core/widgets/custom_drawer.dart';

class MyBooks extends StatelessWidget {
  const MyBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      drawer: CustomDrawer(username: ''),
      appBar: RegularAppBar(
        title: "My Books",
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My books (4)",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.65,
                children: const [
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
                  BookCard(
                    title: "A Game of Thrones",
                    author: "George R. R. Martin",
                    imagePath: AppImages.gameThrones,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
