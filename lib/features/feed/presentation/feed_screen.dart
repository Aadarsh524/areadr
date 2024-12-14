import 'package:areadr/features/feed/cubit/feed_cubit.dart';
import 'package:areadr/features/feed/cubit/feed_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedNewsScreen extends StatelessWidget {
  const FeedNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger the fetchNews method to get news when the widget is loaded
    context.read<FeedNewsCubit>().fetchNews();

    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: BlocBuilder<FeedNewsCubit, FeedNewsState>(
        builder: (context, state) {
          if (state is FeedNewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FeedNewsLoaded) {
            return ListView.builder(
              itemCount: state.feedlist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.feedlist[index]),
                );
              },
            );
          } else if (state is FeedNewsEmpty) {
            return const Center(
              child: Text(
                'No news available.',
                style: TextStyle(color: Colors.grey),
              ),
            );
          } else if (state is FeedNewsError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const Center(child: Text('No news available.'));
          }
        },
      ),
    );
  }
}
