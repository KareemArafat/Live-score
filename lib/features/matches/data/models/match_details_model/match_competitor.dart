import 'package:live_score_app/features/matches/data/models/match_details_model/competitor_member.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/lineup_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/lineup_member_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/member_entity.dart';

class MatchCompetitor {
  MatchCompetitor({
    required this.id,
    required this.countryId,
    required this.sportId,
    required this.name,
    required this.longName,
    required this.score,
    required this.isQualified,
    required this.toQualify,
    required this.isWinner,
    required this.type,
    required this.lineups,
    required this.nameForUrl,
    required this.imageVersion,
    required this.color,
    required this.awayColor,
    required this.mainCompetitionId,
  });

  final int? id;
  final int? countryId;
  final int? sportId;
  final String? name;
  final String? longName;
  final double? score;
  final bool? isQualified;
  final bool? toQualify;
  final bool? isWinner;
  final int? type;
  final CompetitorLineups? lineups;
  final String? nameForUrl;
  final int? imageVersion;
  final String? color;
  final String? awayColor;
  final int? mainCompetitionId;

  factory MatchCompetitor.fromJson(Map<String, dynamic> json) {
    return MatchCompetitor(
      id: json["id"],
      countryId: json["countryId"],
      sportId: json["sportId"],
      name: json["name"],
      longName: json["longName"],
      score: json["score"],
      isQualified: json["isQualified"],
      toQualify: json["toQualify"],
      isWinner: json["isWinner"],
      type: json["type"],
      lineups: json["lineups"] == null
          ? null
          : CompetitorLineups.fromJson(json["lineups"]),
      nameForUrl: json["nameForURL"],
      imageVersion: json["imageVersion"],
      color: json["color"],
      awayColor: json["awayColor"],
      mainCompetitionId: json["mainCompetitionId"],
    );
  }

  LineupEntity toEntity(Map<int, MemberEntity> members) {
    LineupMemberEntity? coach;
    LineupMemberEntity? goalKeeper;
    final List<LineupMemberEntity> line2 = [];
    final List<LineupMemberEntity> line3 = [];
    final List<LineupMemberEntity> line4 = [];
    final List<LineupMemberEntity> line5 = [];
    final List<LineupMemberEntity> substitutions = [];

    for (var item in lineups!.members) {
      if (item.statusText == 'Substitute') {
        substitutions.add(item.toEntity(members));
      } else if (item.statusText == 'Management') {
        coach = item.toEntity(members);
      } else if (item.statusText == 'Starting') {
        switch (item.yardFormation!.line) {
          case 1:
            goalKeeper = item.toEntity(members);
            break;
          case 2:
            line2.add(item.toEntity(members));
            break;
          case 3:
            line3.add(item.toEntity(members));
            break;
          case 4:
            line4.add(item.toEntity(members));
            break;
          default:
            line5.add(item.toEntity(members));
            break;
        }
      }
    }

    return LineupEntity(
      teamId: id ?? 0,
      teamName: name ?? '',
      lineupStatus: lineups?.status ?? '',
      lineupFormation: lineups?.formation ?? '',
      coach: coach!,
      goalKeeper: goalKeeper!,
      line2: line2,
      line3: line3,
      line4: line4,
      line5: line5,
      substitutions: substitutions,
    );
  }
}

class CompetitorLineups {
  CompetitorLineups({
    required this.status,
    required this.formation,
    required this.hasFieldPositions,
    required this.members,
  });

  final String? status;
  final String? formation;
  final bool? hasFieldPositions;
  final List<CompetitorMember> members;

  factory CompetitorLineups.fromJson(Map<String, dynamic> json) {
    return CompetitorLineups(
      status: json["status"],
      formation: json["formation"],
      hasFieldPositions: json["hasFieldPositions"],
      members: json["members"] == null
          ? []
          : List<CompetitorMember>.from(
              json["members"]!.map((x) => CompetitorMember.fromJson(x)),
            ),
    );
  }
}
