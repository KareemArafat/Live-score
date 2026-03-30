import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';

class SearchCompetitor extends TeamEntity {
  SearchCompetitor({
    required this.id,
    required this.competitorCountryId,
    required this.sportId,
    required this.name,
    required this.symbolicName,
    required this.nameForUrl,
    required this.type,
    required this.popularityRank,
    required this.imageVersion,
    required this.color,
    required this.mainCompetitionId,
    required this.hasTransfers,
    required this.competitorNum,
    required this.hideOnSearch,
    required this.hideOnCatalog,
    required this.createdAt,
    required this.awayColor,
    required this.hasSquad,
    required this.shortName,
  }) : super(
         teamId: id,
         teamName: name,
         teamImage: ApiConst.teamImage(id),
         countryId: competitorCountryId,
         countryName: getCountryName(competitorCountryId),
         leagueId: mainCompetitionId,
         leagueImage: ApiConst.leagueImage(mainCompetitionId),
       );

  final int id;
  final int competitorCountryId;
  final int sportId;
  final String name;
  final String symbolicName;
  final String nameForUrl;
  final int type;
  final int popularityRank;
  final int imageVersion;
  final String color;
  final int mainCompetitionId;
  final bool hasTransfers;
  final int competitorNum;
  final bool hideOnSearch;
  final bool hideOnCatalog;
  final DateTime? createdAt;
  final String awayColor;
  final bool hasSquad;
  final String shortName;

  factory SearchCompetitor.fromJson(Map<String, dynamic> json) {
    return SearchCompetitor(
      id: json["id"] ?? 0,
      competitorCountryId: json["countryId"] ?? 0,
      sportId: json["sportId"] ?? 0,
      name: json["name"] ?? "",
      symbolicName: json["symbolicName"] ?? "",
      nameForUrl: json["nameForURL"] ?? "",
      type: json["type"] ?? 0,
      popularityRank: json["popularityRank"] ?? 0,
      imageVersion: json["imageVersion"] ?? 0,
      color: json["color"] ?? "",
      mainCompetitionId: json["mainCompetitionId"] ?? 0,
      hasTransfers: json["hasTransfers"] ?? false,
      competitorNum: json["competitorNum"] ?? 0,
      hideOnSearch: json["hideOnSearch"] ?? false,
      hideOnCatalog: json["hideOnCatalog"] ?? false,
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      awayColor: json["awayColor"] ?? "",
      hasSquad: json["hasSquad"] ?? false,
      shortName: json["shortName"] ?? "",
    );
  }
}
