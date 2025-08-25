import 'package:booky_library/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/book_model.dart';
import '../logic/cubit/fav_cubit.dart';
import '../view/book_details.dart';
import '../../../core/widgets/button_effect.dart';

class BookCard extends StatelessWidget {
  final BookModel book;
  final bool lift;
  final Color textColor;

  const BookCard({
    super.key,
    required this.book,
    this.lift = false,
    this.textColor = AppColors.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          buttonEffectRoute(
            BookDetails(
              title: book.title,
              author: book.author,
              imagePath: book.imagePath,
              genre: book.genre,
            ),
          ),
        );
      },
      child: Transform.translate(
        offset: lift ? const Offset(0, -20) : Offset.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    book.imagePath,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 2,
                  right: 2,
                  child: BlocBuilder<FavCubit, List<BookModel>>(
                    builder: (context, favs) {
                      final isFav = context.read<FavCubit>().isFavorite(book);

                      return IconButton(
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: isFav ? Colors.red : Colors.white,
                          size: 22,
                        ),
                        onPressed: () {
                          context.read<FavCubit>().toggleFavorite(book);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              book.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              book.author,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: textColor, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
