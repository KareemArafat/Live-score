import 'package:live_score_app/features/matches/domain/entities/match_total_stats_entity/match_stat_entity.dart';

class MatchTotalStatsEntity {
  final List<MatchStatEntity> homeStats;
  final List<MatchStatEntity> awayStats;

  MatchTotalStatsEntity({required this.homeStats, required this.awayStats});
}
