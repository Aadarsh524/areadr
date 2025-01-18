import 'package:areadr/cores/constants/colors.dart';
import 'package:areadr/features/bookmark/presentation/bookedmark_screen.dart';
import 'package:areadr/areadr_screen.dart';
import 'package:areadr/features/player/presentation/news_player_screen.dart';
import 'package:areadr/features/search/presentation/search_screen.dart';
import 'package:areadr/features/sources/presentation/sources_screesn.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    // If the first icon (index 0) is tapped, open the drawer

    setState(() {
      _selectedIndex = index; // Switch to other screens
    });
  }

  final List<Widget> screens = [
    const AreadrScreen(),
    const BookedmarkScreen(),
    const NewsPlayerScreen(),
    const SearchScreen(),
    const SourcesScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color for the navigation bar
          borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            _buildNavItem(Icons.home_outlined, isActive: _selectedIndex == 0),
            _buildNavItem(Icons.bookmark_border, isActive: _selectedIndex == 1),
            _buildNavItem(Icons.spatial_audio_outlined,
                isActive: _selectedIndex == 2),
            _buildNavItem(Icons.screen_search_desktop_outlined,
                isActive: _selectedIndex == 3),
            _buildNavItem(Icons.playlist_add_circle_outlined,
                isActive: _selectedIndex == 4),
          ],
        ),
      ),
    ));
  }

  BottomNavigationBarItem _buildNavItem(IconData icon,
      {required bool isActive}) {
    return BottomNavigationBarItem(
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(
            icon,
            size: isActive ? 28 : 24, // Larger size for the active icon
            color: isActive ? AppColors.primary : Colors.grey,
          ),
          // if (isActive)
          //   Positioned(
          //     bottom: -2, // Position the underline below the icon
          //     left: 0,
          //     right: 0,
          //     child: Container(
          //       height: 2, // Thickness of the underline
          //       color: AppColors.primary, // Color of the underline
          //     ),
          //   ),
        ],
      ),
      label: '',
    );
  }
}
