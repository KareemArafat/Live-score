part of 'match_stats_cubit.dart';

sealed class MatchStatsState extends Equatable {
  const MatchStatsState();

  @override
  List<Object> get props => [];
}

final class MatchStatsInitial extends MatchStatsState {}

final class MatchStatsLoading extends MatchStatsState {}

final class MatchStatsSuccess extends MatchStatsState {
  final MatchTotalStatsEntity matchStats;
  const MatchStatsSuccess({required this.matchStats});
}

final class MatchStatsFailure extends MatchStatsState {
  final String errMess;
  const MatchStatsFailure({required this.errMess});
}
