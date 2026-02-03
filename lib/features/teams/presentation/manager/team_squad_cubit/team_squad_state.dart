part of 'team_squad_cubit.dart';

sealed class TeamSquadState extends Equatable {
  const TeamSquadState();

  @override
  List<Object> get props => [];
}

final class TeamSquadInitial extends TeamSquadState {}

final class TeamSquadLoading extends TeamSquadState {}

final class TeamSquadSuccess extends TeamSquadState {
  final SquadEntity squad;
  const TeamSquadSuccess({required this.squad});
}

final class TeamSquadFailure extends TeamSquadState {
  final String errorMess;
  const TeamSquadFailure({required this.errorMess});
}
