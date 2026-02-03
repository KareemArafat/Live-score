part of 'league_matches_cubit.dart';

sealed class LeagueMatchesState extends Equatable {
  const LeagueMatchesState();

  @override
  List<Object> get props => [];
}

final class MatchesInitial extends LeagueMatchesState {}

final class MatchesLoading extends LeagueMatchesState {}

final class MatchesSuccess extends LeagueMatchesState {
  final LeagueMatchesEntity matchesList;
  const MatchesSuccess({required this.matchesList});
}

final class MatchesFailure extends LeagueMatchesState {
  final String errorMess;
  const MatchesFailure({required this.errorMess});
}

class NextMatchesLoading extends LeagueMatchesState {}
class PreviousMatchesLoading extends LeagueMatchesState {}

final class NextMatchesSuccess extends LeagueMatchesState {
  final LeagueMatchesEntity matchesList;
  const NextMatchesSuccess({required this.matchesList});
}

final class PreviousMatchesSuccess extends LeagueMatchesState {
  final LeagueMatchesEntity matchesList;
  const PreviousMatchesSuccess({required this.matchesList});
}
