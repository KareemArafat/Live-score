import 'package:live_score_app/core/utils/app_const.dart';
import 'package:live_score_app/features/matches/data/models/match_total_stats_model/statistic.dart';
import 'package:live_score_app/features/matches/domain/entities/match_total_stats_entity/match_stat_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_total_stats_entity/match_total_stats_entity.dart';
import 'package:live_score_app/shard/models/competitor_model.dart';

class MatchTotalStatsModel {
  MatchTotalStatsModel({required this.statistics, required this.competitors});

  final List<Statistic> statistics;
  final List<CompetitorModel> competitors;

  factory MatchTotalStatsModel.fromJson(Map<String, dynamic> json) {
    return MatchTotalStatsModel(
      statistics: json["statistics"] == null
          ? []
          : List<Statistic>.from(
              json["statistics"]!.map((x) => Statistic.fromJson(x)),
            ),

      competitors: json["competitors"] == null
          ? []
          : List<CompetitorModel>.from(
              json["competitors"]!.map((x) => CompetitorModel.fromJson(x)),
            ),
    );
  }

  MatchTotalStatsEntity toEntity() {
    final List<MatchStatEntity> homeStats = [];
    final List<MatchStatEntity> awayStats = [];
    for (var item in statistics) {
      if (item.competitorId == competitors[0].id &&
          AppConst.matchStatsIdsList.contains(item.id)) {
        homeStats.add(item);
      } else if (item.competitorId == competitors[1].id &&
          AppConst.matchStatsIdsList.contains(item.id)) {
        awayStats.add(item);
      }
    }
    return MatchTotalStatsEntity(homeStats: homeStats, awayStats: awayStats);
  }
}
