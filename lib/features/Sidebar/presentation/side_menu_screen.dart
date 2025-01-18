import 'package:areadr/cores/constants/colors.dart';
import 'package:areadr/features/authentication/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenuScreen extends StatefulWidget {
  const SideMenuScreen({super.key});

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth *
                0.05, // Adjust horizontal padding based on screen size
            vertical: screenWidth *
                0.05, // Adjust vertical padding based on screen size
          ),
          child: Column(
            children: [
              // Profile Section
              const SizedBox(height: 20),

              // Feeds section with Edit button
              Expanded(
                flex: 1,
                child: _buildSectionHeader(context,
                    title: "title",
                    icon: Icons.abc,
                    onTap: () {},
                    isEmpty: true),
              ),

              // Menu Items Section
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    _buildMenuItem(
                      icon: Icons.payment_outlined,
                      label: 'Upgrade',
                      onTap: () {
                        // Navigate to Upgrade screen or show upgrade action
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.settings,
                      label: 'Settings',
                      onTap: () {
                        // Navigate to Settings screen
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildProfileSection(),
                    _buildLogoutButton(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Version: 1.0.0',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.secondary,
                            )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primary,
            backgroundImage: currentUser?.photoURL != null
                ? NetworkImage(currentUser!.photoURL!)
                : const AssetImage('assets/images/default_avatar.png')
                    as ImageProvider,
            radius: 20,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentUser?.displayName ?? 'User Name',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                currentUser?.email ?? 'user@example.com',
                style: Theme.of(context).textTheme.headlineSmall,
                softWrap: true, // Allows wrapping the text to the next line
                overflow: TextOverflow
                    .visible, // Prevents ellipsis overflow (optional)
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context,
      {required String title,
      required IconData icon,
      required VoidCallback onTap,
      required bool isEmpty}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isEmpty) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    size: 22,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
        if (isEmpty) ...[
          Text(
            'Personalize with your interest!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'News is important. Add your feeds to stay updated.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondary,
                ),
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Add Feed',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildMenuItem(
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: AppColors.secondary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.primary,
                size: 24,
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<AuthCubit>(context).signOut();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 4),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the content horizontally
            children: [
              const Icon(
                Icons.exit_to_app,
                color: AppColors.white,
                size: 24,
              ),
              const SizedBox(width: 16),
              Text(
                'Logout',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.white,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
