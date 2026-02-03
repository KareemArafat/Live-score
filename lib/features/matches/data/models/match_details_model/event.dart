import 'package:live_score_app/features/matches/domain/entities/match_details_entity/events_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/member_entity.dart';

class Event {
  Event({
    required this.competitorId,
    required this.statusId,
    required this.stageId,
    required this.order,
    required this.num,
    required this.gameTime,
    required this.addedTime,
    required this.gameTimeDisplay,
    required this.gameTimeAndStatusDisplayType,
    required this.memberId,
    required this.isMajor,
    required this.eventType,
    required this.extraPlayers,
  });

  final int? competitorId;
  final int? statusId;
  final int? stageId;
  final int? order;
  final int? num;
  final double? gameTime;
  final int? addedTime;
  final String? gameTimeDisplay;
  final int? gameTimeAndStatusDisplayType;
  final int? memberId;
  final bool? isMajor;
  final EventType? eventType;
  final List<int> extraPlayers;

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      competitorId: json["competitorId"],
      statusId: json["statusId"],
      stageId: json["stageId"],
      order: json["order"],
      num: json["num"],
      gameTime: json["gameTime"],
      addedTime: json["addedTime"],
      gameTimeDisplay: json["gameTimeDisplay"],
      gameTimeAndStatusDisplayType: json["gameTimeAndStatusDisplayType"],
      memberId: json["playerId"],
      isMajor: json["isMajor"],
      eventType: json["eventType"] == null
          ? null
          : EventType.fromJson(json["eventType"]),
      extraPlayers: json["extraPlayers"] == null
          ? []
          : List<int>.from(json["extraPlayers"]!.map((x) => x)),
    );
  }

  EventsEntity toEntity(Map<int, MemberEntity> members) {
    return EventsEntity(
      teamId: competitorId ?? 0,
      playerId: members[memberId]!.playerId,
      playerName: members[memberId]!.playerShortName,
      playerImage: members[memberId]!.playerImage,
      extraPlayerId: extraPlayers.isNotEmpty
          ? members[extraPlayers[0]]?.playerId
          : null,
      extraPlayerName: extraPlayers.isNotEmpty
          ? members[extraPlayers[0]]?.playerShortName
          : null,
      extraPlayerImage: extraPlayers.isNotEmpty
          ? members[extraPlayers[0]]?.playerImage
          : null,
      eventName: eventType?.name ?? '',
      eventDetails: eventType?.subTypeName,
      time: gameTime?.toInt() ?? 0,
    );
  }
}

class EventType {
  EventType({
    required this.id,
    required this.name,
    required this.subTypeId,
    required this.subTypeName,
  });

  final int? id;
  final String? name;
  final int? subTypeId;
  final String? subTypeName;

  factory EventType.fromJson(Map<String, dynamic> json) {
    return EventType(
      id: json["id"],
      name: json["name"],
      subTypeId: json["subTypeId"],
      subTypeName: json["subTypeName"],
    );
  }
}
