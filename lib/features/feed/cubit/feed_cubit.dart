import 'package:areadr/features/feed/cubit/feed_state.dart';
import 'package:bloc/bloc.dart';

class FeedNewsCubit extends Cubit<FeedNewsState> {
  FeedNewsCubit() : super(FeedNewsInitial());

  Future<void> fetchNews() async {
    emit(FeedNewsLoading());
    try {
      // Simulating network call or data fetching
      await Future.delayed(const Duration(seconds: 2));

      // Assuming news data is a list of strings
      List<String> fetchedNews = [
        "Breaking News 1",
        "Breaking News 2",
        "Breaking News 3",
        // Uncomment the next line to simulate an empty feed:
        //  "Breaking News 4",
      ];

      if (fetchedNews.isEmpty) {
        emit(FeedNewsEmpty());
      } else {
        emit(FeedNewsLoaded(feedlist: fetchedNews));
      }
    } catch (e) {
      emit(FeedNewsError(message: "Failed to load news"));
    }
  }
}
