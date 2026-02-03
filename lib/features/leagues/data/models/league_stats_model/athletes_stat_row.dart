import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/features/leagues/data/models/league_stats_model/player_stats_info.dart';
import 'package:live_score_app/features/leagues/data/models/league_stats_model/stat.dart';
import 'package:live_score_app/features/leagues/domain/entities/league_stats_entity.dart';

class AthletesStatRow extends LeaguePlayersStatsEntity {
  final num? position;
  final String? secondaryStatName;
  final PlayerStatsInfo? playerStatsInfo;
  final List<Stat> stats;

  AthletesStatRow({
    required this.position,
    required this.secondaryStatName,
    required this.playerStatsInfo,
    required this.stats,
    String? teamName,
    String? teamLogo,
  }) : super(
         playerId: playerStatsInfo?.id ?? 0,
         playerName: playerStatsInfo?.name ?? '',
         playerImage: ApiConst.playerImage(playerStatsInfo?.id ?? 0),
         teamId: playerStatsInfo?.competitorId ?? 0,
         teamName: teamName ?? '',
         teamLogo: teamLogo ?? '',
         goals: stats[0].value ?? '0',
         assists: stats[0].value ?? '0',
         penalties: stats.length > 1 ? stats[1].value : '#',
       );

  factory AthletesStatRow.fromJson(Map<String, dynamic> json) {
    return AthletesStatRow(
      position: json["position"],
      secondaryStatName: json["secondaryStatName"],
      playerStatsInfo: json["entity"] == null
          ? null
          : PlayerStatsInfo.fromJson(json["entity"]),
      stats: json["stats"] == null
          ? []
          : List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
    );
  }

  AthletesStatRow copyWith({String? teamName, String? teamLogo}) {
    return AthletesStatRow(
      position: position,
      secondaryStatName: secondaryStatName,
      playerStatsInfo: playerStatsInfo,
      stats: stats,
      teamName: teamName ?? this.teamName,
      teamLogo: teamLogo ?? this.teamLogo,
    );
  }
}
