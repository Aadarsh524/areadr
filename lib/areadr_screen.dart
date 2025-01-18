import 'package:areadr/cores/constants/colors.dart';
import 'package:areadr/features/Sidebar/presentation/side_menu_screen.dart';
import 'package:areadr/features/feed/presentation/feed_screen.dart';
import 'package:flutter/material.dart';

class AreadrScreen extends StatefulWidget {
  const AreadrScreen({super.key});

  @override
  State<AreadrScreen> createState() => _AreadrScreenState();
}

class _AreadrScreenState extends State<AreadrScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey, // Use the GlobalKey for controlling the Scaffold
        endDrawer: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(0),
            ),
          ),
          elevation: 0,
          width: MediaQuery.of(context).size.width * 0.80,
          child: const SideMenuScreen(),
        ),
        appBar: AppBar(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          leading: const Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundColor: AppColors.white,
              backgroundImage: AssetImage(
                  'assets/images/logo.png'), // Replace with your image
              radius: 16,
            ),
          ),
          title: Text(
            'Today',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          centerTitle: true, // Centers the title
          actions: [
            IconButton(
              icon: const Icon(Icons.more_horiz_outlined),
              onPressed: () {
                // Handle settings button
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Settings clicked!")),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.add_outlined),
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
          ],
          elevation: 0, // Adds a shadow
          bottom: const TabBar(
            isScrollable: false,
            indicatorColor: AppColors.primary,
            indicatorWeight: 3, // A more prominent indicator
            unselectedLabelColor: AppColors.secondary,
            labelColor: AppColors.primary,
            tabs: [
              Tab(
                text: 'My Feed',
              ),
              Tab(
                text: 'Explore More',
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: TabBarView(
            children: [
              // My Feed Page
              const FeedNewsScreen(),

              // Explore More Page
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore More',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Content for Explore More goes here.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
