import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const DrawerItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.secondary),
      title: Text(title, style: const TextStyle(fontSize: 15)),
      onTap: () {
        // TODO: navigation
      },
    );
  }
}
