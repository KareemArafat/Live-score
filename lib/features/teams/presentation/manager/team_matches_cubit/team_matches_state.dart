part of 'team_matches_cubit.dart';

sealed class TeamMatchesState extends Equatable {
  const TeamMatchesState();

  @override
  List<Object> get props => [];
}

final class TeamMatchesInitial extends TeamMatchesState {}

final class TeamMatchesLoading extends TeamMatchesState {}

final class TeamMatchesSuccess extends TeamMatchesState {
  final LeagueMatchesEntity matches;
  const TeamMatchesSuccess({required this.matches});
}

final class TeamMatchesFailure extends TeamMatchesState {
  final String errorMess;
  const TeamMatchesFailure({required this.errorMess});
}

class PreviousMatchesLoading extends TeamMatchesState {}

final class PreviousMatchesSuccess extends TeamMatchesState {
  final LeagueMatchesEntity matchesList;
  const PreviousMatchesSuccess({required this.matchesList});
}

final class PreviousMatchesFailure extends TeamMatchesState {
  final String errorMess;
  const PreviousMatchesFailure({required this.errorMess});
}

class NextMatchesLoading extends TeamMatchesState {}

final class NextMatchesSuccess extends TeamMatchesState {
  final LeagueMatchesEntity matchesList;
  const NextMatchesSuccess({required this.matchesList});
}

final class NextMatchesFailure extends TeamMatchesState {
  final String errorMess;
  const NextMatchesFailure({required this.errorMess});
}
