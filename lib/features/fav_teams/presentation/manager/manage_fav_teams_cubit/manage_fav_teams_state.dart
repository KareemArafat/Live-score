import 'package:equatable/equatable.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';

sealed class ManageFavTeamsState extends Equatable {
  const ManageFavTeamsState();

  @override
  List<Object> get props => [];
}

final class ManageFavTeamsInitial extends ManageFavTeamsState {}

final class GetFavTeamsLoading extends ManageFavTeamsState {}

final class GetFavTeamsSuccess extends ManageFavTeamsState {
  final List<TeamEntity> teams;
  const GetFavTeamsSuccess({required this.teams});
}
