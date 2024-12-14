import 'package:areadr/features/explore/cubit/explore_cubit.dart';
import 'package:areadr/features/explore/cubit/explore_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: Column(
        children: [
          // Filter Buttons
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterButton(label: "Trending", filter: "Trending"),
                FilterButton(label: "Local", filter: "Local"),
                FilterButton(label: "International", filter: "International"),
              ],
            ),
          ),
          // Explore Content
          Expanded(
            child: BlocBuilder<ExploreCubit, ExploreState>(
              builder: (context, state) {
                String filter = "Trending"; // Default filter

                if (state is ExploreFilterChanged) {
                  filter = state.filter;
                }

                return Center(
                  child: Text(
                    'Showing content for: $filter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final String filter;

  const FilterButton({super.key, required this.label, required this.filter});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<ExploreCubit>().setFilter(filter);
      },
      child: Text(label),
    );
  }
}
