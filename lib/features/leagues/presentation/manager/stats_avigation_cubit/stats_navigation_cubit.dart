import 'package:flutter_bloc/flutter_bloc.dart';

enum StatsTab { goals, assists }

class StatsNavigationCubit extends Cubit<StatsTab> {
  StatsNavigationCubit() : super(StatsTab.goals);

  void navigateTo(StatsTab tab) => emit(tab);
}
