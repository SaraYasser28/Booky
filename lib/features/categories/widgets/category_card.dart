import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(12),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 3,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
