class MemberEntity {
  final int memberId;
  final int teamId;
  final int playerId;
  final String playerName;
  final String playerShortName;
  final String playerImage;
  final int? number;

  MemberEntity({
    required this.memberId,
    required this.teamId,
    required this.playerId,
    required this.playerName,
    required this.playerShortName,
    required this.playerImage,
    required this.number,
  });
}
