part of 'team_standing_cubit.dart';

sealed class TeamStandingState extends Equatable {
  const TeamStandingState();

  @override
  List<Object> get props => [];
}

final class TeamTableRankInitial extends TeamStandingState {}

final class TeamTableRankLoading extends TeamStandingState {}

final class TeamTableRankSuccess extends TeamStandingState {
  final TableEntity table;
  const TeamTableRankSuccess({required this.table});
}

final class TeamTableRankFailure extends TeamStandingState {
  final String errorMess;
  const TeamTableRankFailure({required this.errorMess});
}
