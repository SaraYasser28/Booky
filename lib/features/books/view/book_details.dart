import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../../core/widgets/regular_appbar.dart';
import '../../search/view/search_screen.dart';
import '../data/models/book_model.dart';
import '../logic/cubit/fav_cubit.dart';

class BookDetails extends StatelessWidget {
  final BookModel book;

  const BookDetails({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cover Image
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  book.imagePath,
                  height: 260,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Book Info Card
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 8,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    book.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "by ${book.author}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Rating stars
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < book.rating.round()
                            ? Icons.star
                            : Icons.star_border,
                        color: AppColors.primary,
                        size: 22,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Genre & Availability
                  Text(
                    "Genre: ${book.genre}",
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  Text(
                    book.available ? "Available" : "Unavailable",
                    style: TextStyle(
                      color: book.available
                          ? AppColors.primary
                          : Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Add to favourites button
                  BlocBuilder<FavCubit, List<BookModel>>(
                    builder: (context, favBooks) {
                      final isFav = context.read<FavCubit>().isFavorite(book);
                      return ElevatedButton.icon(
                        onPressed: () {
                          context.read<FavCubit>().toggleFavorite(book);
                        },
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: Colors.white,
                        ),
                        label: Text(
                          isFav
                              ? "Remove from Favourites"
                              : "Add to Favourites",
                          style: const TextStyle(fontSize: 16),
                        ),
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
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Description Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                book.notes,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: AppColors.secondary,
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
