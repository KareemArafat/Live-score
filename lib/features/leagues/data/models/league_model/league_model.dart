import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/shard/entities/league_entity.dart';

class LeagueModel extends LeagueEntity {
  LeagueModel({
    required this.id,
    required this.leagueCountryId,
    required this.sportId,
    required this.name,
    required this.hasStandings,
    required this.hasBrackets,
    required this.hasStats,
    required this.hasTransfers,
    required this.hasStandingsGroups,
    required this.hasBets,
    required this.totalGames,
    required this.liveGames,
    required this.nameForUrl,
    required this.popularityRank,
    required this.hasActiveGames,
    required this.tableName,
    required this.bracketsName,
    required this.currentSeasonNum,
    required this.currentStageNum,
    required this.color,
    required this.competitorsType,
    required this.imageVersion,
    required this.currentPhaseName,
    required this.hideOnCatalog,
    required this.hideOnSearch,
    required this.hasCurrentStageStandings,
    required this.hasHistory,
    required this.isActive,
    required this.hasLiveStandings,
    required this.shortName,
    required this.longName,
  }) : super(
         leagueId: id ?? 0,
         leagueName: name ?? 'UnKnown League',
         leagueImage: ApiConst.leagueImage(id ?? 0),
         countryId: leagueCountryId ?? 0,
         countryName: getCountryName(leagueCountryId ?? 0),
       );

  final int? id;
  final int? leagueCountryId;
  final int? sportId;
  final String? name;
  final bool? hasStandings;
  final bool? hasBrackets;
  final bool? hasStats;
  final bool? hasTransfers;
  final bool? hasStandingsGroups;
  final bool? hasBets;
  final int? totalGames;
  final int? liveGames;
  final String? nameForUrl;
  final int? popularityRank;
  final bool? hasActiveGames;
  final String? tableName;
  final String? bracketsName;
  final int? currentSeasonNum;
  final int? currentStageNum;
  final String? color;
  final int? competitorsType;
  final int? imageVersion;
  final String? currentPhaseName;
  final bool? hideOnCatalog;
  final bool? hideOnSearch;
  final bool? hasCurrentStageStandings;
  final bool? hasHistory;
  final bool? isActive;
  final bool? hasLiveStandings;
  final String? shortName;
  final String? longName;

  factory LeagueModel.fromJson(Map<String, dynamic> json) {
    return LeagueModel(
      id: json["id"],
      leagueCountryId: json["countryId"],
      sportId: json["sportId"],
      name: json["name"],
      hasStandings: json["hasStandings"],
      hasBrackets: json["hasBrackets"],
      hasStats: json["hasStats"],
      hasTransfers: json["hasTransfers"],
      hasStandingsGroups: json["hasStandingsGroups"],
      hasBets: json["hasBets"],
      totalGames: json["totalGames"],
      liveGames: json["liveGames"],
      nameForUrl: json["nameForURL"],
      popularityRank: json["popularityRank"],
      hasActiveGames: json["hasActiveGames"],
      tableName: json["tableName"],
      bracketsName: json["bracketsName"],
      currentSeasonNum: json["currentSeasonNum"],
      currentStageNum: json["currentStageNum"],
      color: json["color"],
      competitorsType: json["competitorsType"],
      imageVersion: json["imageVersion"],
      currentPhaseName: json["currentPhaseName"],
      hideOnCatalog: json["hideOnCatalog"],
      hideOnSearch: json["hideOnSearch"],
      hasCurrentStageStandings: json["hasCurrentStageStandings"],
      hasHistory: json["hasHistory"],
      isActive: json["isActive"],
      hasLiveStandings: json["hasLiveStandings"],
      shortName: json["shortName"],
      longName: json["longName"],
    );
  }
}
