import 'package:areadr/cores/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SideMenuScreen extends StatefulWidget {
  const SideMenuScreen({super.key});

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              // Header section - you can add a user profile or app logo here

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // The text 'Feeds'
                Text(
                  'Feeds',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(width: 8), // Space between text and icon

                // The plus icon at the end
                Container(
                  padding: const EdgeInsets.all(4.0), // Padding around the icon
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.secondary, // Border color
                      width: 2, // Border width
                    ),
                    borderRadius: BorderRadius.circular(
                        8), // Border radius for rounded corners
                  ),
                  child: const Icon(
                    Icons.edit, // The icon
                    size: 18, // Adjust the icon size
                    color: AppColors.primary, // Icon color
                  ),
                ),
              ]),
              const Divider(
                color: AppColors.secondary,
              ),

              Expanded(
                  flex: 2,
                  child: ListView(
                    children: const [],
                  )),
              const Divider(
                color: AppColors.secondary,
              ),

              Expanded(
                flex: 2,
                child: ListView(
                  children: [
                    _menuItem(Icons.payment_outlined, 'Upgrade', () {
                      // Navigate to Upgrade screen or show upgrade action
                    }),
                    _menuItem(Icons.settings, 'Settings', () {
                      // Navigate to Settings screen
                    }),
                    const Divider(
                      color: AppColors.secondary,
                    ), // Divider between sections
                    _menuItem(Icons.exit_to_app, 'Logout', () {
                      // Perform logout action
                    }),
                    _menuItem(Icons.person_3_outlined, '${currentUser!.email}',
                        () {
                      // Perform logout action
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable method for creating each menu item
  Widget _menuItem(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
        size: 24,
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      onTap: onTap,
    );
  }
}
