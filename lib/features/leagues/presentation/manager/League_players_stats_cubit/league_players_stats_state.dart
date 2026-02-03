part of 'league_players_stats_cubit.dart';

sealed class LeaguePlayersStatsState extends Equatable {
  const LeaguePlayersStatsState();

  @override
  List<Object> get props => [];
}

final class StatsInitial extends LeaguePlayersStatsState {}

final class StatsLoading extends LeaguePlayersStatsState {}

final class StatsSuccess extends LeaguePlayersStatsState {
  final LeagueStatsEntity playersStats;

  const StatsSuccess({required this.playersStats});
}

final class StatsFailure extends LeaguePlayersStatsState {
  final String errorMess;
  const StatsFailure({required this.errorMess});
}
