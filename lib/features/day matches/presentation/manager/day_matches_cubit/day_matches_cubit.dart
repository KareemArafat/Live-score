import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/day%20matches/domain/use_cases/get_all_matches_use_case.dart';
import 'package:live_score_app/features/day%20matches/domain/use_cases/get_fav_matches_use_case.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';

part 'day_matches_state.dart';

class DayMatchesCubit extends Cubit<DayMatchesState> {
  DayMatchesCubit(this._getDayMatchesUseCase, this._getFavMatchesUseCase)
    : super(DayMatchesInitial());

  final GetAllMatchesUseCase _getDayMatchesUseCase;
  final GetFavMatchesUseCase _getFavMatchesUseCase;

  String? day;

  getDayMatches({bool isRefresh = false}) async {
    if (state is RefreshLoading) return;
    isRefresh ? emit(RefreshLoading()) : emit(DayMatchesLoading());

    final result = await _getDayMatchesUseCase.execute(day: day);

    result.fold(
      (l) {
        if (l.errMessage == 'cancelled') return;
        emit(DayMatchesFailure(errMess: l.errMessage));
      },
      (r) {
        final favMatches = _getFavMatchesUseCase.execute(allMatches: r);
        emit(DayMatchesSuccess(allMatches: r, favMatches: favMatches));
      },
    );
  }
}
