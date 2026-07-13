import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';

class TeamModel extends TeamEntity {
  final int? id;
  final int? competitorCountryId;
  final String? name;
  final String? longName;
  final String? symbolicName;
  final num? score;
  final bool? isWinner;
  final String? nameForUrl;
  final int? type;
  final List<Ranking>? rankings;
  final String? color;
  final String? awayColor;
  final int? mainCompetitionId;
  final bool? hasSquad;
  final bool? hasTransfers;
  final int? competitorNum;

  TeamModel({
    this.id,
    this.competitorCountryId,
    this.name,
    this.longName,
    this.symbolicName,
    this.score,
    this.isWinner,
    this.nameForUrl,
    this.type,
    this.rankings,
    this.color,
    this.awayColor,
    this.mainCompetitionId,
    this.hasSquad,
    this.hasTransfers,
    this.competitorNum,
  }) : super(
         teamId: id!,
         teamName: name!,
         teamImage: ApiConst.teamImage(id),
         isNational: type != 1,
         nationalRank: rankings?.first.position ?? 00,
         countryId: competitorCountryId!,
         countryName: getCountryName(id),
         countryImage: getCountryImage(id),
       );

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      id: json['id'] as int?,
      competitorCountryId: json['countryId'] as int?,
      name: json['name'] as String?,
      longName: json['longName'] as String?,
      symbolicName: json['symbolicName'] as String?,
      score: json['score'] as num?,
      isWinner: json['isWinner'] as bool?,
      nameForUrl: json['nameForURL'] as String?,
      type: json['type'] as int?,
      rankings: json["rankings"] == null
          ? null
          : List<Ranking>.from(
              json["rankings"]!.map((x) => Ranking.fromJson(x)),
            ),
      color: json['color'] as String?,
      awayColor: json['awayColor'] as String?,
      mainCompetitionId: json['mainCompetitionId'] as int?,
      hasSquad: json['hasSquad'] as bool?,
      hasTransfers: json['hasTransfers'] as bool?,
      competitorNum: json['competitorNum'] as int?,
    );
  }
}

class Ranking {
  const Ranking({required this.name, required this.position});

  final String name;
  final int position;

  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(name: json["name"] ?? "", position: json["position"] ?? 0);
  }
}
