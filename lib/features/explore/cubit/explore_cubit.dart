import 'package:areadr/features/explore/cubit/explore_state.dart';
import 'package:bloc/bloc.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreInitial());

  void setFilter(String filter) {
    emit(ExploreFilterChanged(filter: filter));
  }
}
