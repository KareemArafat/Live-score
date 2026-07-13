import 'package:live_score_app/shard/entities/team_entity.dart';

class MatchEntity {
  final int matchId;
  final int leagueId;
  final String leagueName;
  final String leagueImage;
  final bool matchHasLineups;
  final bool matchHasStats;
  final bool matchHasStandings;
  final int homeTeamGoals;
  final int awayTeamGoals;
  final String date;
  final String status;
  final TeamEntity homeTeam;
  final TeamEntity awayTeam;
  final int? minutes;
  final int? round;
  final int? season;

  MatchEntity({
    required this.matchId,
    required this.leagueId,
    required this.leagueName,
    required this.leagueImage,
    required this.matchHasLineups,
    required this.matchHasStats,
    required this.matchHasStandings,
    required this.homeTeamGoals,
    required this.awayTeamGoals,
    required this.date,
    required this.status,
    required this.homeTeam,
    required this.awayTeam,
    required this.minutes,
    required this.round,
    required this.season,
  });
}
