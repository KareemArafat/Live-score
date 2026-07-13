import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/shard/entities/league_entity.dart';

class LeagueModel extends LeagueEntity {
  final int? id;
  final int? competitionCountryId;
  final String? name;
  final String? shortName;
  final bool? hasStandings;
  final bool? hasBrackets;
  final bool? hasStats;
  final bool? hasTransfers;
  final bool? hasLiveStandings;
  final bool? hasStandingsGroups;
  final int? totalGames;
  final int? liveGames;
  final String? nameForUrl;
  final bool? hasActiveGames;
  final String? tableName;
  final int? currentSeasonNum;
  final int? currentStageNum;
  final String? color;
  final int? competitorsType;
  final bool? hasCurrentStageStandings;
  final bool? hasHistory;
  final bool? isActive;

  LeagueModel({
    this.id,
    this.competitionCountryId,
    this.name,
    this.shortName,
    this.hasStandings,
    this.hasBrackets,
    this.hasStats,
    this.hasTransfers,
    this.hasLiveStandings,
    this.hasStandingsGroups,
    this.totalGames,
    this.liveGames,
    this.nameForUrl,
    this.hasActiveGames,
    this.tableName,
    this.currentSeasonNum,
    this.currentStageNum,
    this.color,
    this.competitorsType,
    this.hasCurrentStageStandings,
    this.hasHistory,
    this.isActive,
  }) : super(
         leagueId: id!,
         leagueName: name!,
         leagueImage: ApiConst.leagueImage(id),
         countryId: competitionCountryId!,
         countryName: getCountryName(competitionCountryId),
         countryImage: getCountryImage(competitionCountryId),
         standings: hasStandings ?? false,
         stats: hasStats ?? false,
         seasonNum: currentSeasonNum ?? 0,
         isNational: competitorsType != 1,
       );

  factory LeagueModel.fromJson(Map<String, dynamic> json) => LeagueModel(
    id: json['id'] as int?,
    competitionCountryId: json['countryId'] as int?,
    name: json['name'] as String?,
    hasStandings: json['hasStandings'] as bool?,
    hasBrackets: json['hasBrackets'] as bool?,
    hasStats: json['hasStats'] as bool?,
    hasTransfers: json['hasTransfers'] as bool?,
    hasLiveStandings: json['hasLiveStandings'] as bool?,
    hasStandingsGroups: json['hasStandingsGroups'] as bool?,
    totalGames: json['totalGames'] as int?,
    liveGames: json['liveGames'] as int?,
    nameForUrl: json['nameForURL'] as String?,
    hasActiveGames: json['hasActiveGames'] as bool?,
    tableName: json['tableName'] as String?,
    currentSeasonNum: json['currentSeasonNum'] as int?,
    currentStageNum: json['currentStageNum'] as int?,
    color: json['color'] as String?,
    competitorsType: json['competitorsType'] as int?,
    hasCurrentStageStandings: json['hasCurrentStageStandings'] as bool?,
    hasHistory: json['hasHistory'] as bool?,
    isActive: json['isActive'] as bool?,
    shortName: json['shortName'] as String?,
  );
}
