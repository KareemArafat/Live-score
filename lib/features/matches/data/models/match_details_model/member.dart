import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/member_entity.dart';

class Member extends MemberEntity {
  Member({
    required this.competitorId,
    required this.id,
    required this.athleteId,
    required this.name,
    required this.shortName,
    required this.jerseyNumber,
    required this.nameForUrl,
    required this.imageVersion,
  }) : super(
         memberId: id ?? 0,
         teamId: competitorId ?? 0,
         playerId: athleteId ?? 0,
         playerName: name ?? '',
         playerShortName: shortName ?? '',
         playerImage: ApiConst.playerImage(athleteId ?? 0),
         number: jerseyNumber,
       );

  final int? competitorId;
  final int? id;
  final int? athleteId;
  final String? name;
  final String? shortName;
  final int? jerseyNumber;
  final String? nameForUrl;
  final int? imageVersion;

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      competitorId: json["competitorId"],
      id: json["id"],
      athleteId: json["athleteId"],
      name: json["name"],
      shortName: json["shortName"],
      jerseyNumber: json["jerseyNumber"],
      nameForUrl: json["nameForURL"],
      imageVersion: json["imageVersion"],
    );
  }
}
