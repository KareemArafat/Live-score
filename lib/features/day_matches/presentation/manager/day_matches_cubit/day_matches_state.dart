part of 'day_matches_cubit.dart';

sealed class DayMatchesState extends Equatable {
  const DayMatchesState();

  @override
  List<Object> get props => [];
}

final class DayMatchesInitial extends DayMatchesState {}

final class DayMatchesLoading extends DayMatchesState {}

final class RefreshLoading extends DayMatchesState {}

final class DayMatchesSuccess extends DayMatchesState {
  final List<MatchEntity> allMatches;
  final List<MatchEntity> favMatches;
  const DayMatchesSuccess({required this.allMatches, required this.favMatches});
}

final class DayMatchesFailure extends DayMatchesState {
  final String errMess;
  const DayMatchesFailure({required this.errMess});
}
