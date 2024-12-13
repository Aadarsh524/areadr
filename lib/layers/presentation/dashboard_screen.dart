import 'package:areadr/cores/constants/colors.dart';
import 'package:areadr/layers/presentation/bookedmark_screen.dart';
import 'package:areadr/layers/presentation/areadr_screen.dart';
import 'package:areadr/layers/presentation/news_player_screen.dart';
import 'package:areadr/layers/presentation/search_screen.dart';
import 'package:areadr/layers/presentation/side_menu_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 2;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    // If the first icon (index 0) is tapped, open the drawer
    if (index == 0) {
      _scaffoldKey.currentState?.openDrawer();
    } else {
      setState(() {
        _selectedIndex = index; // Switch to other screens
      });
    }
  }

  final List<Widget> screens = [
    const SideMenuScreen(),
    const NewsPlayerScreen(),
    const AreadrScreen(),
    const BookedmarkScreen(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey, // Use the GlobalKey for controlling the Scaffold
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.75,
          child: const SideMenuScreen(),
        ),

        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed, // Ensure all icons are visible
          iconSize: 26,
          showSelectedLabels: false, // Hide labels
          showUnselectedLabels: false, // Hide labels
          selectedItemColor:
              AppColors.primary, // Highlight color for selected icon
          unselectedItemColor:
              AppColors.secondary, // Default color for unselected icons
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.toc_outlined),
              label: '', // No label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lyrics_rounded),
              label: '', // No label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined),
              label: '', // No label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border_outlined),
              label: '', // No label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: '', // No label
            ),
          ],
        ),
      ),
    );
  }
}
