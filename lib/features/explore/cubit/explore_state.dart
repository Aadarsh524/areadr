import 'package:equatable/equatable.dart';

abstract class ExploreState extends Equatable {
  @override
  List<Object> get props => [];
}

class ExploreInitial extends ExploreState {}

class ExploreFilterChanged extends ExploreState {
  final String filter;

  ExploreFilterChanged({required this.filter});

  @override
  List<Object> get props => [filter];
}
