import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  final String username;
  const CustomDrawer({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: AppColors.primary,
                  size: 28,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Welcome, $username!",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const DrawerItem(icon: Icons.person, title: "Profile"),
            const DrawerItem(icon: Icons.folder, title: "Catalog"),
            const DrawerItem(icon: Icons.group, title: "Friends"),
            const DrawerItem(icon: Icons.groups, title: "Groups"),
            const DrawerItem(icon: Icons.event, title: "Events"),
            const DrawerItem(icon: Icons.settings, title: "Settings"),
            const DrawerItem(icon: Icons.exit_to_app, title: "Sign out"),
          ],
        ),
      ),
    );
  }
}
