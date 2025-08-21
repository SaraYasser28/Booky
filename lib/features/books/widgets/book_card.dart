import 'package:booky_library/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../view/book_details.dart';
import '../../../core/widgets/button_effect.dart';

class BookCard extends StatefulWidget {
  final String title;
  final String author;
  final String imagePath;
  final bool lift;
  final Color textColor;

  const BookCard({
    super.key,
    required this.title,
    required this.author,
    required this.imagePath,
    this.lift = false,
    this.textColor = AppColors.secondary,
  });

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          buttonEffectRoute(
            BookDetails(
              title: widget.title,
              author: widget.author,
              imagePath: widget.imagePath,
              genre: "Fantasy",
            ),
          ),
        );
      },
      child: Transform.translate(
        offset: widget.lift ? const Offset(0, -20) : Offset.zero,
        child: Container(
          width: 120,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      widget.imagePath,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavourite = !isFavourite;
                        });
                      },
                      child: Icon(
                        isFavourite ? Icons.favorite : Icons.favorite_border,
                        color: isFavourite ? Colors.red : Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                widget.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: widget.textColor),
              ),
              Text(
                widget.author,
                style: TextStyle(color: widget.textColor, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
