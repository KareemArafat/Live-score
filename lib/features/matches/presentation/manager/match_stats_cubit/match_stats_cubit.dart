import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/matches/domain/entities/match_total_stats_entity/match_total_stats_entity.dart';
import 'package:live_score_app/features/matches/domain/use_cases/get_match_stats_use_case.dart';

part 'match_stats_state.dart';

class MatchStatsCubit extends Cubit<MatchStatsState> {
  MatchStatsCubit(this._matchStatsUseCase) : super(MatchStatsInitial());

  final GetMatchStatsUseCase _matchStatsUseCase;

  Future<void> getMatchStats({required int matchId}) async {
    emit(MatchStatsLoading());

    final result = await _matchStatsUseCase.execute(matchId: matchId);
    result.fold(
      (l) => emit(MatchStatsFailure(errMess: l.errMessage)),
      (r) => emit(MatchStatsSuccess(matchStats: r)),
    );
  }
}
