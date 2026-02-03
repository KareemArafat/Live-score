class MatchStatEntity {
  final int teamId;
  final int statId;
  final String statName;
  final String statValue;
  final double statePercent;

  MatchStatEntity({
    required this.teamId,
    required this.statId,
    required this.statName,
    required this.statValue,
    required this.statePercent,
  });
}
