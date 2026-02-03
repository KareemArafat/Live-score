class EventsEntity {
  final int teamId;
  final int playerId;
  final String playerName;
  final String playerImage;
  final int? extraPlayerId;
  final String? extraPlayerName;
  final String? extraPlayerImage;
  final String eventName;
  final String? eventDetails;
  final int time;

  EventsEntity({
    required this.teamId,
    required this.playerId,
    required this.playerName,
    required this.playerImage,
    required this.extraPlayerId,
    required this.extraPlayerName,
    required this.extraPlayerImage,
    required this.eventName,
    required this.eventDetails,
    required this.time,
  });
}
