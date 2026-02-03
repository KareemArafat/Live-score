import 'package:equatable/equatable.dart';

class CompetitionModel extends Equatable {
  final int? id;
  final int? countryId;
  final int? sportId;
  final String? name;
  final bool? hasStandings;
  final bool? hasBrackets;
  final bool? hasStats;
  final bool? hasTransfers;
  final bool? hasLiveStandings;
  final bool? hasStandingsGroups;
  final bool? hasBets;
  final int? totalGames;
  final int? liveGames;
  final String? nameForUrl;
  final int? popularityRank;
  final bool? hasActiveGames;
  final String? tableName;
  final int? currentSeasonNum;
  final int? currentStageNum;
  final String? color;
  final int? competitorsType;
  final int? imageVersion;
  final bool? hideOnCatalog;
  final bool? hideOnSearch;
  final bool? hasCurrentStageStandings;
  final bool? hasHistory;
  final bool? isActive;
  final String? shortName;

  const CompetitionModel({
    this.id,
    this.countryId,
    this.sportId,
    this.name,
    this.hasStandings,
    this.hasBrackets,
    this.hasStats,
    this.hasTransfers,
    this.hasLiveStandings,
    this.hasStandingsGroups,
    this.hasBets,
    this.totalGames,
    this.liveGames,
    this.nameForUrl,
    this.popularityRank,
    this.hasActiveGames,
    this.tableName,
    this.currentSeasonNum,
    this.currentStageNum,
    this.color,
    this.competitorsType,
    this.imageVersion,
    this.hideOnCatalog,
    this.hideOnSearch,
    this.hasCurrentStageStandings,
    this.hasHistory,
    this.isActive,
    this.shortName,
  });

  factory CompetitionModel.fromJson(Map<String, dynamic> json) =>
      CompetitionModel(
        id: json['id'] as int?,
        countryId: json['countryId'] as int?,
        sportId: json['sportId'] as int?,
        name: json['name'] as String?,
        hasStandings: json['hasStandings'] as bool?,
        hasBrackets: json['hasBrackets'] as bool?,
        hasStats: json['hasStats'] as bool?,
        hasTransfers: json['hasTransfers'] as bool?,
        hasLiveStandings: json['hasLiveStandings'] as bool?,
        hasStandingsGroups: json['hasStandingsGroups'] as bool?,
        hasBets: json['hasBets'] as bool?,
        totalGames: json['totalGames'] as int?,
        liveGames: json['liveGames'] as int?,
        nameForUrl: json['nameForURL'] as String?,
        popularityRank: json['popularityRank'] as int?,
        hasActiveGames: json['hasActiveGames'] as bool?,
        tableName: json['tableName'] as String?,
        currentSeasonNum: json['currentSeasonNum'] as int?,
        currentStageNum: json['currentStageNum'] as int?,
        color: json['color'] as String?,
        competitorsType: json['competitorsType'] as int?,
        imageVersion: json['imageVersion'] as int?,
        hideOnCatalog: json['hideOnCatalog'] as bool?,
        hideOnSearch: json['hideOnSearch'] as bool?,
        hasCurrentStageStandings: json['hasCurrentStageStandings'] as bool?,
        hasHistory: json['hasHistory'] as bool?,
        isActive: json['isActive'] as bool?,
        shortName: json['shortName'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'countryId': countryId,
    'sportId': sportId,
    'name': name,
    'hasStandings': hasStandings,
    'hasBrackets': hasBrackets,
    'hasStats': hasStats,
    'hasTransfers': hasTransfers,
    'hasLiveStandings': hasLiveStandings,
    'hasStandingsGroups': hasStandingsGroups,
    'hasBets': hasBets,
    'totalGames': totalGames,
    'liveGames': liveGames,
    'nameForURL': nameForUrl,
    'popularityRank': popularityRank,
    'hasActiveGames': hasActiveGames,
    'tableName': tableName,
    'currentSeasonNum': currentSeasonNum,
    'currentStageNum': currentStageNum,
    'color': color,
    'competitorsType': competitorsType,
    'imageVersion': imageVersion,
    'hideOnCatalog': hideOnCatalog,
    'hideOnSearch': hideOnSearch,
    'hasCurrentStageStandings': hasCurrentStageStandings,
    'hasHistory': hasHistory,
    'isActive': isActive,
    'shortName': shortName,
  };

  @override
  List<Object?> get props {
    return [
      id,
      countryId,
      sportId,
      name,
      hasStandings,
      hasBrackets,
      hasStats,
      hasTransfers,
      hasLiveStandings,
      hasStandingsGroups,
      hasBets,
      totalGames,
      liveGames,
      nameForUrl,
      popularityRank,
      hasActiveGames,
      tableName,
      currentSeasonNum,
      currentStageNum,
      color,
      competitorsType,
      imageVersion,
      hideOnCatalog,
      hideOnSearch,
      hasCurrentStageStandings,
      hasHistory,
      isActive,
      shortName,
    ];
  }
}
