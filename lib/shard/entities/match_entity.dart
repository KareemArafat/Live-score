import 'package:live_score_app/shard/entities/league_entity.dart';

class MatchEntity {
  final int matchId;
  final int homeTeamId;
  final String homeTeamName;
  final String homeTeamImage;
  final int awayTeamId;
  final String awayTeamName;
  final String awayTeamImage;
  final bool matchHasLineups;
  final bool matchHasStats;
  final bool matchHasStandings;
  final int homeTeamGoals;
  final int awayTeamGoals;
  final String date;
  final String status;
  final int? minutes;
  final int? round;
  final int? season;
  final LeagueEntity league;

  MatchEntity({
    required this.matchId,
    required this.homeTeamId,
    required this.homeTeamName,
    required this.homeTeamImage,
    required this.awayTeamId,
    required this.awayTeamName,
    required this.awayTeamImage,
    required this.matchHasLineups,
    required this.matchHasStats,
    required this.matchHasStandings,
    required this.homeTeamGoals,
    required this.awayTeamGoals,
    required this.date,
    required this.status,
    this.minutes,
    this.round,
    this.season,
    required this.league,
  }) ;
}
