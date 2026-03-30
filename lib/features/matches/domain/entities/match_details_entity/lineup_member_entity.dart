class LineupMemberEntity {
  final int lineupPlayerId;
  final int lineupCountryId;
  final int teamId;
  final int playerId;
  final String playerName;
  final String playerImage;
  final int playerNum;
  final double rate;
  final bool hasStats;
  final String positionName;
  final int line;
  final double linePosition;
  final bool isBench;
  final List<LineupMemberStatsEntity> memberStats;

  LineupMemberEntity({
    required this.lineupPlayerId,
    required this.lineupCountryId,
    required this.teamId,
    required this.playerId,
    required this.playerName,
    required this.playerImage,
    required this.playerNum,
    required this.rate,
    required this.hasStats,
    required this.positionName,
    required this.line,
    required this.linePosition,
    required this.isBench,
    required this.memberStats,
  });

  int getStat(String name) {
    for (final stat in memberStats) {
      if (stat.statName == name) return int.parse(stat.statValue);
    }
    return 0;
  }
}

class LineupMemberStatsEntity {
  final String statName;
  final String statValue;

  LineupMemberStatsEntity({required this.statName, required this.statValue});
}
