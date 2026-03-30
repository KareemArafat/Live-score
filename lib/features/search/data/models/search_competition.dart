import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/shard/entities/league_entity.dart';

class SearchCompetition extends LeagueEntity {
  SearchCompetition({
    required this.id,
    required this.createdAt,
    required this.competitionCountryId,
    required this.sportId,
    required this.name,
    required this.hasStandings,
    required this.hasLiveStandings,
    required this.hasStandingsGroups,
    required this.hasBrackets,
    required this.hasStats,
    required this.nameForUrl,
    required this.popularityRank,
    required this.imageVersion,
    required this.currentStageType,
    required this.color,
    required this.competitorsType,
    required this.currentPhaseNum,
    required this.currentSeasonNum,
    required this.currentStageNum,
    required this.isInternational,
    required this.hasHistory,
  }) : super(
         leagueId: id,
         leagueName: name,
         leagueImage: ApiConst.leagueImage(id),
         countryId: competitionCountryId,
         countryName: getCountryName(competitionCountryId),
         standings: hasStandings,
         liveStandings: hasLiveStandings,
         stats: hasStats,
         groups: hasStandingsGroups,
       );

  final int id;
  final DateTime? createdAt;
  final int competitionCountryId;
  final int sportId;
  final String name;
  final bool hasStandings;
  final bool hasLiveStandings;
  final bool hasStandingsGroups;
  final bool hasBrackets;
  final bool hasStats;
  final String nameForUrl;
  final int popularityRank;
  final int imageVersion;
  final int currentStageType;
  final String color;
  final int competitorsType;
  final int currentPhaseNum;
  final int currentSeasonNum;
  final int currentStageNum;
  final bool isInternational;
  final bool hasHistory;

  factory SearchCompetition.fromJson(Map<String, dynamic> json) {
    return SearchCompetition(
      id: json["id"] ?? 0,
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      competitionCountryId: json["countryId"] ?? 0,
      sportId: json["sportId"] ?? 0,
      name: json["name"] ?? "",
      hasStandings: json["hasStandings"] ?? false,
      hasLiveStandings: json["hasLiveStandings"] ?? false,
      hasStandingsGroups: json["hasStandingsGroups"] ?? false,
      hasBrackets: json["hasBrackets"] ?? false,
      hasStats: json["hasStats"] ?? false,
      nameForUrl: json["nameForURL"] ?? "",
      popularityRank: json["popularityRank"] ?? 0,
      imageVersion: json["imageVersion"] ?? 0,
      currentStageType: json["currentStageType"] ?? 0,
      color: json["color"] ?? "",
      competitorsType: json["competitorsType"] ?? 0,
      currentPhaseNum: json["currentPhaseNum"] ?? 0,
      currentSeasonNum: json["currentSeasonNum"] ?? 0,
      currentStageNum: json["currentStageNum"] ?? 0,
      isInternational: json["isInternational"] ?? false,
      hasHistory: json["hasHistory"] ?? false,
    );
  }
}
