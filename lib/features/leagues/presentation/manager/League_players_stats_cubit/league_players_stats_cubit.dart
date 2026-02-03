import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/leagues/domain/entities/league_stats_entity.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_players_stats_use_case.dart';

part 'league_players_stats_state.dart';

class LeaguePlayersStatsCubit extends Cubit<LeaguePlayersStatsState> {
  LeaguePlayersStatsCubit(this._getLeaguePlayersStatsUseCase)
    : super(StatsInitial());
  final GetLeaguePlayersStatsUseCase _getLeaguePlayersStatsUseCase;

  void getLeaguePlayersStats({required int leagueId}) async {
    emit(StatsLoading());
    var result = await _getLeaguePlayersStatsUseCase.execute(
      leagueId: leagueId,
    );

    result.fold(
      (l) => emit(StatsFailure(errorMess: l.errMessage)),
      (r) => emit(StatsSuccess(playersStats: r)),
    );
  }
}
