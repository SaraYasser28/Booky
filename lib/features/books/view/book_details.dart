import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../../core/widgets/regular_appbar.dart';

class BookDetails extends StatelessWidget {
  final String title;
  final String author;
  final String imagePath;
  final String genre;
  final double rating;
  final bool available;

  const BookDetails({
    super.key,
    required this.title,
    required this.author,
    required this.imagePath,
    required this.genre,
    this.rating = 4.0,
    this.available = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(username: ''),
      appBar: RegularAppBar(
        title: "Booky",
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 6,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(imagePath, height: 170),
              ),
            ),
            const SizedBox(height: 16),

            // Title & Author
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              author,
              style: const TextStyle(color: AppColors.secondary, fontSize: 14),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Rating: "),
                ...List.generate(
                  5,
                  (index) => Icon(
                    index < rating.round() ? Icons.star : Icons.star_border,
                    color: AppColors.primary,
                    size: 18,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Genre
            Text(
              "Genre: $genre",
              style: const TextStyle(color: Colors.black87, fontSize: 14),
            ),

            const SizedBox(height: 6),

            // Availability
            Text(
              available ? "Available" : "Unavailable",
              style: TextStyle(
                color: available ? AppColors.primary : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.activeButton,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 14,
                ),
              ),
              child: const Text(
                "Add to Favourites",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            // Description
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Mauris vel imperdiet justo. Fusce congue sit amet orci et "
              "facilisis. Sed molestie tortor sed mi tempor, at tempor dui "
              "tincidunt. Donec posuere scelerisque odio...",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: AppColors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
