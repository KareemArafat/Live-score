import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/shard/entities/league_entity.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'away_competitor.dart';
import 'home_competitor.dart';

class Game extends MatchEntity {
  final int? id;
  final int? sportId;
  final int? competitionId;
  final int? seasonNum;
  final int? stageNum;
  final int? roundNum;
  final String? roundName;
  final String? competitionDisplayName;
  final String? startTime;
  final int? statusGroup;
  final String? statusText;
  final String? shortStatusText;
  final int? gameTimeAndStatusDisplayType;
  final bool? justEnded;
  final num? gameTime;
  final String? gameTimeDisplay;
  final bool? hasLineups;
  final bool? hasMissingPlayers;
  final bool? hasFieldPositions;
  final int? lineupsStatus;
  final String? lineupsStatusText;
  final bool? hasTvNetworks;
  final HomeCompetitor? homeCompetitor;
  final AwayCompetitor? awayCompetitor;
  final bool? isHomeAwayInverted;
  final bool? hasStats;
  final bool? hasStandings;
  final String? standingsName;
  final bool? hasBrackets;
  final bool? hasPreviousMeetings;
  final bool? hasRecentMatches;
  final bool? hasBets;
  final int? winner;
  final int? homeAwayTeamOrder;
  final bool? hasNews;
  final bool? hasPointByPoint;
  final bool? hasVideo;

  Game({
    this.id,
    this.sportId,
    this.competitionId,
    this.seasonNum,
    this.stageNum,
    this.roundNum,
    this.roundName,
    this.competitionDisplayName,
    this.startTime,
    this.statusGroup,
    this.statusText,
    this.shortStatusText,
    this.gameTimeAndStatusDisplayType,
    this.justEnded,
    this.gameTime,
    this.gameTimeDisplay,
    this.hasLineups,
    this.hasMissingPlayers,
    this.hasFieldPositions,
    this.lineupsStatus,
    this.lineupsStatusText,
    this.hasTvNetworks,
    this.homeCompetitor,
    this.awayCompetitor,
    this.isHomeAwayInverted,
    this.hasStats,
    this.hasStandings,
    this.standingsName,
    this.hasBrackets,
    this.hasPreviousMeetings,
    this.hasRecentMatches,
    this.hasBets,
    this.winner,
    this.homeAwayTeamOrder,
    this.hasNews,
    this.hasPointByPoint,
    this.hasVideo,
  }) : super(
         matchId: id ?? 0,
         date: startTime ?? '',
         status: statusText ?? '',
         minutes: gameTime?.toInt(),
         season: seasonNum ?? 0,
         round: roundNum,
         homeTeamId: homeCompetitor!.id!,
         homeTeamName: homeCompetitor.name ?? '',
         homeTeamImage: ApiConst.teamImage(homeCompetitor.id!),
         homeTeamGoals: homeCompetitor.score!.toInt(),
         awayTeamId: awayCompetitor!.id!,
         awayTeamName: awayCompetitor.name ?? '',
         awayTeamImage: ApiConst.teamImage(awayCompetitor.id!),
         awayTeamGoals: awayCompetitor.score!.toInt(),
         matchHasLineups: hasLineups ?? false,
         matchHasStandings: hasStandings ?? false,
         matchHasStats: hasStats ?? false,
         league: LeagueEntity(
           leagueId: competitionId ?? 0,
           leagueName: competitionDisplayName ?? '',
           leagueImage: ApiConst.leagueImage(competitionId ?? 0),
           countryId: 0,
           countryName: '',
         ),
       );

  factory Game.fromJson(Map<String, dynamic> json) => Game(
    id: json['id'] as int?,
    sportId: json['sportId'] as int?,
    competitionId: json['competitionId'] as int?,
    seasonNum: json['seasonNum'] as int?,
    stageNum: json['stageNum'] as int?,
    roundNum: json['roundNum'] as int?,
    roundName: json['roundName'] as String?,
    competitionDisplayName: json['competitionDisplayName'] as String?,
    startTime: json['startTime'] as String?,
    statusGroup: json['statusGroup'] as int?,
    statusText: json['statusText'] as String?,
    shortStatusText: json['shortStatusText'] as String?,
    gameTimeAndStatusDisplayType: json['gameTimeAndStatusDisplayType'] as int?,
    justEnded: json['justEnded'] as bool?,
    gameTime: json['gameTime'] as num?,
    gameTimeDisplay: json['gameTimeDisplay'] as String?,
    hasLineups: json['hasLineups'] as bool?,
    hasMissingPlayers: json['hasMissingPlayers'] as bool?,
    hasFieldPositions: json['hasFieldPositions'] as bool?,
    lineupsStatus: json['lineupsStatus'] as int?,
    lineupsStatusText: json['lineupsStatusText'] as String?,
    hasTvNetworks: json['hasTVNetworks'] as bool?,
    homeCompetitor: json['homeCompetitor'] == null
        ? null
        : HomeCompetitor.fromJson(
            json['homeCompetitor'] as Map<String, dynamic>,
          ),
    awayCompetitor: json['awayCompetitor'] == null
        ? null
        : AwayCompetitor.fromJson(
            json['awayCompetitor'] as Map<String, dynamic>,
          ),
    isHomeAwayInverted: json['isHomeAwayInverted'] as bool?,
    hasStats: json['hasStats'] as bool?,
    hasStandings: json['hasStandings'] as bool?,
    standingsName: json['standingsName'] as String?,
    hasBrackets: json['hasBrackets'] as bool?,
    hasPreviousMeetings: json['hasPreviousMeetings'] as bool?,
    hasRecentMatches: json['hasRecentMatches'] as bool?,
    hasBets: json['hasBets'] as bool?,
    winner: json['winner'] as int?,
    homeAwayTeamOrder: json['homeAwayTeamOrder'] as int?,
    hasNews: json['hasNews'] as bool?,
    hasPointByPoint: json['hasPointByPoint'] as bool?,
    hasVideo: json['hasVideo'] as bool?,
  );
}
