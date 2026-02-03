import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';

class CompetitorModel extends TeamEntity {
  CompetitorModel({
    required this.id,
    required this.competitorCountryId,
    required this.sportId,
    required this.name,
    required this.longName,
    required this.symbolicName,
    required this.nameForUrl,
    required this.type,
    required this.popularityRank,
    required this.imageVersion,
    required this.color,
    required this.awayColor,
    required this.mainCompetitionId,
    required this.hasSquad,
    required this.hasTransfers,
    required this.competitorNum,
    required this.hideOnSearch,
    required this.hideOnCatalog,
    required this.shortName,
    required this.score,
    required this.isWinner,
    required this.outcome,
    required this.isQualified,
    required this.toQualify,
  }) : super(
         teamId: id ?? 0,
         teamName: name ?? 'Unknown Team',
         teamLogo: ApiConst.teamImage(id ?? 0),
         countryId: competitorCountryId ?? 0,
         countryName: getCountryName(competitorCountryId ?? 0),
         countryFlag: '',
         leagueId: mainCompetitionId ?? 0,
       );

  final int? id;
  final int? competitorCountryId;
  final int? sportId;
  final String? name;
  final String? longName;
  final String? symbolicName;
  final String? nameForUrl;
  final int? type;
  final int? popularityRank;
  final int? imageVersion;
  final String? color;
  final String? awayColor;
  final int? mainCompetitionId;
  final bool? hasSquad;
  final bool? hasTransfers;
  final int? competitorNum;
  final bool? hideOnSearch;
  final bool? hideOnCatalog;
  final String? shortName;
  final int? score;
  final bool? isWinner;
  final int? outcome;
  final bool? isQualified;
  final bool? toQualify;

  factory CompetitorModel.fromJson(Map<String, dynamic> json) {
    return CompetitorModel(
      id: json["id"],
      competitorCountryId: json["countryId"],
      sportId: json["sportId"],
      name: json["name"],
      longName: json["longName"],
      symbolicName: json["symbolicName"],
      nameForUrl: json["nameForURL"],
      type: json["type"],
      popularityRank: json["popularityRank"],
      imageVersion: json["imageVersion"],
      color: json["color"],
      awayColor: json["awayColor"],
      mainCompetitionId: json["mainCompetitionId"],
      hasSquad: json["hasSquad"],
      hasTransfers: json["hasTransfers"],
      competitorNum: json["competitorNum"],
      hideOnSearch: json["hideOnSearch"],
      hideOnCatalog: json["hideOnCatalog"],
      shortName: json["shortName"],
      score: json["score"],
      isWinner: json["isWinner"],
      outcome: json["outcome"],
      isQualified: json["isQualified"],
      toQualify: json["toQualify"],
    );
  }
}
