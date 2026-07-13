import 'package:equatable/equatable.dart';
import 'package:live_score_app/features/leagues/domain/entities/league_stats_entity/league_player_states_entity.dart';

class LeagueStatsEntity extends Equatable {
  final List<LeaguePlayersStatsEntity> goals;
  final List<LeaguePlayersStatsEntity> assists;

  const LeagueStatsEntity({required this.goals, required this.assists});

  @override
  List<Object?> get props => [goals, assists];
}
