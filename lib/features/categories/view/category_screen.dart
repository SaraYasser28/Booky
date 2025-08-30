import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/widgets/curved_appbar.dart';
import '../../../core/widgets/custom_drawer.dart';
import '../../books/logic/cubit/book_cubit.dart';
import '../../books/logic/cubit/book_state.dart';
import '../../books/widgets/book_card.dart';

class CategoryScreen extends StatelessWidget {
  final String genre;

  const CategoryScreen({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(username: ''),

      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          if (state is BookInitial) {
            context.read<BookCubit>().fetchBooksByGenre(genre);
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (state is BookLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (state is BookError) {
            return Center(child: Text("Error: ${state.message}"));
          }

          if (state is BookLoaded) {
            final books = state.books;

            return CustomScrollView(
              slivers: [
                CurvedAppBar(
                  title: "Booky",
                  subtitle: genre,
                  backgroundImage: _getGenreImage(genre),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Books (${books.length})",
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: books.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 0.65,
                              ),
                          itemBuilder: (context, index) {
                            return BookCard(book: books[index]);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  String _getGenreImage(String genre) {
    switch (genre.toLowerCase()) {
      case "fantasy":
        return AppImages.fantasy;
      case "fiction":
        return AppImages.fiction;
      case "romance":
        return AppImages.romance;
      case "horror":
        return AppImages.horror;
      case "crime":
        return AppImages.crime;
      case "youngadult":
        return AppImages.youngAdult;
      default:
        return AppImages.fiction;
    }
  }
}
