import 'package:equatable/equatable.dart';

class LeagueStatsEntity extends Equatable {
  final List<LeaguePlayersStatsEntity> goals;
  final List<LeaguePlayersStatsEntity> assists;

  const LeagueStatsEntity({required this.goals, required this.assists});

  @override
  List<Object?> get props => [goals, assists];
}

class LeaguePlayersStatsEntity extends Equatable {
  final int playerId;
  final String playerName;
  final String playerImage;
  final int teamId;
  final String teamName;
  final String teamLogo;
  final String? goals;
  final String? assists;
  final String? penalties;

  const LeaguePlayersStatsEntity({
    required this.playerId,
    required this.playerName,
    required this.playerImage,
    required this.teamId,
    required this.teamName,
    required this.teamLogo,
    this.goals,
    this.assists,
    this.penalties,
  });

  @override
  List<Object?> get props => [
    playerId,
    playerName,
    playerImage,
    teamId,
    teamName,
    teamLogo,
    goals,
    assists,
    penalties,
  ];
}
