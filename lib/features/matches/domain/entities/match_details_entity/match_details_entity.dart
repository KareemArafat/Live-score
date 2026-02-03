import 'package:live_score_app/features/matches/domain/entities/match_details_entity/events_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/info_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/lineup_entity.dart';

class MatchDetailsEntity {
  final int matchId;
  final int leagueId;
  final String leagueName;
  final String leagueImage;
  final int homeTeamGoals;
  final int awayTeamGoals;
  final int minutes;
  final String matchStatus;
  final List<EventsEntity> events;
  final LineupEntity? homeLineUp;
  final LineupEntity? awayLineUp;
  final InfoEntity info;
  final bool hasLineups;
  final bool hasStats;
  final bool hasStandings;

  MatchDetailsEntity({
    required this.matchId,
    required this.leagueId,
    required this.leagueName,
    required this.leagueImage,
    required this.homeTeamGoals,
    required this.awayTeamGoals,
    required this.minutes,
    required this.matchStatus,
    required this.events,
    required this.homeLineUp,
    required this.awayLineUp,
    required this.info,
    required this.hasLineups,
    required this.hasStats,
    required this.hasStandings,
  });
}
