import 'package:equatable/equatable.dart';
import 'package:live_score_app/shard/entities/league_entity.dart';
import 'package:live_score_app/shard/entities/player_entity.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';

class SearchResultEntity extends Equatable {
  final List<LeagueEntity> leagueEntity;
  final List<TeamEntity> teamEntity;
  final List<PlayerEntity> playerEntity;

  const SearchResultEntity({
    required this.leagueEntity,
    required this.teamEntity,
    required this.playerEntity,
  });

  @override
  List<Object?> get props => [leagueEntity, teamEntity, playerEntity];
}
