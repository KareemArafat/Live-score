import 'package:live_score_app/features/matches/domain/entities/match_details_entity/lineup_member_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/member_entity.dart';

class CompetitorMember {
  CompetitorMember({
    required this.status,
    required this.statusText,
    required this.position,
    required this.formation,
    required this.yardFormation,
    required this.ranking,
    required this.memberHasStats,
    required this.stats,
    required this.heatMap,
    required this.popularityRank,
    required this.competitorId,
    required this.nationalId,
    required this.id,
    required this.hasShotChart,
    required this.hasHighestRanking,
    required this.substitution,
    required this.injury,
  });

  final int? status;
  final String? statusText;
  final Position? position;
  final Formation? formation;
  final YardFormation? yardFormation;
  final double? ranking;
  final bool? memberHasStats;
  final List<MemberStat> stats;
  final String? heatMap;
  final int? popularityRank;
  final int? competitorId;
  final int? nationalId;
  final int? id;
  final bool? hasShotChart;
  final bool? hasHighestRanking;
  final Substitution? substitution;
  final Injury? injury;

  factory CompetitorMember.fromJson(Map<String, dynamic> json) {
    return CompetitorMember(
      status: json["status"],
      statusText: json["statusText"],
      position: json["position"] == null
          ? null
          : Position.fromJson(json["position"]),
      formation: json["formation"] == null
          ? null
          : Formation.fromJson(json["formation"]),
      yardFormation: json["yardFormation"] == null
          ? null
          : YardFormation.fromJson(json["yardFormation"]),
      ranking: json["ranking"],
      memberHasStats: json["hasStats"],
      stats: json["stats"] == null
          ? []
          : List<MemberStat>.from(
              json["stats"]!.map((x) => MemberStat.fromJson(x)),
            ),
      heatMap: json["heatMap"],
      popularityRank: json["popularityRank"],
      competitorId: json["competitorId"],
      nationalId: json["nationalId"],
      id: json["id"],
      hasShotChart: json["hasShotChart"],
      hasHighestRanking: json["hasHighestRanking"],
      substitution: json["substitution"] == null
          ? null
          : Substitution.fromJson(json["substitution"]),
      injury: json["injury"] == null ? null : Injury.fromJson(json["injury"]),
    );
  }

  LineupMemberEntity toEntity(Map<int, MemberEntity> members) {
    return LineupMemberEntity(
      lineupPlayerId: id ?? 0,
      lineupCountryId: nationalId ?? 0,
      teamId: competitorId ?? 0,
      playerId: members[id]?.playerId ?? 0,
      playerName: members[id]?.playerName ?? '',
      playerImage: members[id]?.playerImage ?? '',
      playerNum: members[id]?.number ?? 0,
      rate: ranking ?? -1,
      hasStats: memberHasStats ?? false,
      positionName: position?.name ?? '',
      line: yardFormation?.line ?? 0,
      linePosition: yardFormation?.fieldSide?.toDouble() ?? 0,
      isBench: statusText == 'Starting' ? false : true,
      memberStats: stats,
    );
  }
}

class Substitution {
  Substitution({
    required this.playerId,
    required this.time,
    required this.type,
    required this.status,
    required this.eventOrder,
    required this.addedTime,
  });

  final int? playerId;
  final num? time;
  final num? type;
  final num? status;
  final num? eventOrder;
  final num? addedTime;

  factory Substitution.fromJson(Map<String, dynamic> json) {
    return Substitution(
      playerId: json["playerId"],
      time: json["time"],
      type: json["type"],
      status: json["status"],
      eventOrder: json["eventOrder"],
      addedTime: json["addedTime"],
    );
  }
}

class MemberStat extends LineupMemberStatsEntity {
  MemberStat({
    required this.type,
    required this.value,
    required this.isTop,
    required this.categoryId,
    required this.name,
    required this.shortName,
    required this.order,
    required this.imageId,
  }) : super(statName: name ?? '', statValue: value ?? ' ');

  final int? type;
  final String? value;
  final bool? isTop;
  final int? categoryId;
  final String? name;
  final String? shortName;
  final int? order;
  final int? imageId;

  factory MemberStat.fromJson(Map<String, dynamic> json) {
    return MemberStat(
      type: json["type"],
      value: json["value"],
      isTop: json["isTop"],
      categoryId: json["categoryId"],
      name: json["name"],
      shortName: json["shortName"],
      order: json["order"],
      imageId: json["imageId"],
    );
  }
}

class YardFormation {
  YardFormation({
    required this.line,
    required this.fieldPosition,
    required this.fieldLine,
    required this.fieldSide,
  });

  final int? line;
  final int? fieldPosition;
  final int? fieldLine;
  final num? fieldSide;

  factory YardFormation.fromJson(Map<String, dynamic> json) {
    return YardFormation(
      line: json["line"],
      fieldPosition: json["fieldPosition"],
      fieldLine: json["fieldLine"],
      fieldSide: json["fieldSide"],
    );
  }
}

class Formation {
  Formation({required this.id, required this.name, required this.shortName});

  final int? id;
  final String? name;
  final String? shortName;

  factory Formation.fromJson(Map<String, dynamic> json) {
    return Formation(
      id: json["id"],
      name: json["name"],
      shortName: json["shortName"],
    );
  }
}

class Position {
  Position({required this.id, required this.name});

  final int? id;
  final String? name;

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(id: json["id"], name: json["name"]);
  }
}

class Injury {
  Injury({
    required this.categoryId,
    required this.reason,
    required this.expectedReturn,
    required this.imageId,
    required this.imageVersion,
  });

  final int? categoryId;
  final String? reason;
  final String? expectedReturn;
  final String? imageId;
  final int? imageVersion;

  factory Injury.fromJson(Map<String, dynamic> json) {
    return Injury(
      categoryId: json["categoryId"],
      reason: json["reason"],
      expectedReturn: json["expectedReturn"],
      imageId: json["imageId"],
      imageVersion: json["imageVersion"],
    );
  }
}
