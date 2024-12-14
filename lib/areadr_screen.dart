import 'package:areadr/cores/constants/colors.dart';
import 'package:areadr/features/feed/presentation/feed_screen.dart';
import 'package:flutter/material.dart';

class AreadrScreen extends StatelessWidget {
  const AreadrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
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
              icon: const Icon(Icons.add_outlined),
              onPressed: () {
                // Handle notifications button
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Notifications clicked!")),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz_outlined),
              onPressed: () {
                // Handle settings button
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Settings clicked!")),
                );
              },
            ),
          ],
          elevation: 0, // Adds a shadow
          bottom: TabBar(
            dividerColor: AppColors.secondary,
            indicatorWeight: 0.5, // Thickness of the indicator line
            indicatorSize: TabBarIndicatorSize.tab, // Size of the indicator

            unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
            labelStyle: Theme.of(context).textTheme.labelSmall,
            tabs: const [
              Tab(
                text: 'My Feed',
              ),
              Tab(
                text: 'Explore More',
              ),
            ],
            indicatorColor: AppColors.secondary, // Highlight color
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
