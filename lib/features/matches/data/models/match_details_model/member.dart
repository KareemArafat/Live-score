import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/member_entity.dart';

class Member extends MemberEntity {
  final int? competitorId;
  final int? id;
  final int? athleteId;
  final String? name;
  final String? shortName;
  final int? jerseyNumber;
  final String? nameForUrl;
  final int? imageVersion;

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
         memberId: id!,
         teamId: competitorId!,
         playerId: athleteId!,
         playerName: name!,
         playerShortName: shortName ?? name,
         playerImage: ApiConst.playerTeamImage(athleteId),
         number: jerseyNumber,
       );

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
