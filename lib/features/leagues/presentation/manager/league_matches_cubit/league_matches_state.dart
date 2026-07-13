part of 'league_matches_cubit.dart';

sealed class LeagueMatchesState extends Equatable {
  const LeagueMatchesState();

  @override
  List<Object> get props => [];
}

final class MatchesInitial extends LeagueMatchesState {}

final class MatchesLoading extends LeagueMatchesState {}

final class PreviousMatchesLoading extends LeagueMatchesState {}

final class NextMatchesLoading extends LeagueMatchesState {}

final class MatchesNotAvailable extends LeagueMatchesState {}

final class MatchesFailure extends LeagueMatchesState {
  final String errorMess;
  const MatchesFailure({required this.errorMess});
}

final class PreviousMatchesFailure extends LeagueMatchesState {
  final String errorMess;
  const PreviousMatchesFailure({required this.errorMess});
}

final class NextMatchesFailure extends LeagueMatchesState {
  final String errorMess;
  const NextMatchesFailure({required this.errorMess});
}

final class MatchesSuccess extends LeagueMatchesState {
  final LeagueMatchesEntity leagueMatchesEntity;
  const MatchesSuccess({required this.leagueMatchesEntity});
}
