// Define the News States
import 'package:equatable/equatable.dart';

abstract class FeedNewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class FeedNewsInitial extends FeedNewsState {}

class FeedNewsLoading extends FeedNewsState {}

class FeedNewsEmpty extends FeedNewsState {}

class FeedNewsLoaded extends FeedNewsState {
  final List<String> feedlist;

  FeedNewsLoaded({required this.feedlist});

  @override
  List<Object> get props => [feedlist];
}

class FeedNewsError extends FeedNewsState {
  final String message;

  FeedNewsError({required this.message});

  @override
  List<Object> get props => [message];
}
