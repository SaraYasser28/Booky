import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../features/search/view/search_screen.dart';
import '../constants/app_colors.dart';

class CurvedAppBar extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? backgroundImage;
  final Widget? overlayChild;
  final List<Widget>? actions;
  final Widget? leading;
  final bool pinned;

  const CurvedAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.backgroundImage,
    this.overlayChild,
    this.actions,
    this.leading,
    this.pinned = true,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: pinned,
      expandedHeight: 390,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading:
          leading ??
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 32,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      actions:
          actions ??
          [
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
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                decoration: BoxDecoration(
                  image: backgroundImage != null
                      ? DecorationImage(
                          image: AssetImage(backgroundImage!),
                          fit: BoxFit.cover,
                        )
                      : null,
                  color: AppColors.primary,
                ),
              ),
            ),
            if (subtitle != null)
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    subtitle!,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (overlayChild != null) overlayChild!,
          ],
        ),
      ),
    );
  }
}
