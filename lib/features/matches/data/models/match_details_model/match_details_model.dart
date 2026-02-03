import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/features/matches/data/models/match_details_model/event.dart';
import 'package:live_score_app/features/matches/data/models/match_details_model/match_competitor.dart';
import 'package:live_score_app/features/matches/data/models/match_details_model/member.dart';
import 'package:live_score_app/features/matches/data/models/match_details_model/official.dart';
import 'package:live_score_app/features/matches/data/models/match_details_model/venue.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/info_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/match_details_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/events_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/member_entity.dart';

class MatchDetailsModel {
  MatchDetailsModel({
    required this.id,
    required this.competitionId,
    required this.seasonNum,
    required this.stageNum,
    required this.roundNum,
    required this.roundName,
    required this.competitionDisplayName,
    required this.startTime,
    required this.statusGroup,
    required this.statusText,
    required this.shortStatusText,
    required this.justEnded,
    required this.gameTime,
    required this.gameTimeDisplay,
    required this.hasLineups,
    required this.hasMissingPlayers,
    required this.hasFieldPositions,
    required this.homeCompetitor,
    required this.awayCompetitor,
    required this.events,
    required this.isHomeAwayInverted,
    required this.hasStats,
    required this.hasStandings,
    required this.standingsName,
    required this.hasPreviousMeetings,
    required this.venue,
    required this.officials,
    required this.members,
    required this.gameStageHasTable,
    required this.hasNews,
  });

  final int? id;
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
  final bool? justEnded;
  final double? gameTime;
  final String? gameTimeDisplay;
  final bool? hasLineups;
  final bool? hasMissingPlayers;
  final bool? hasFieldPositions;
  final MatchCompetitor? homeCompetitor;
  final MatchCompetitor? awayCompetitor;
  final List<Event> events;
  final bool? isHomeAwayInverted;
  final bool? hasStats;
  final bool? hasStandings;
  final String? standingsName;
  final bool? hasPreviousMeetings;
  final Venue? venue;
  final List<Official> officials;
  final List<Member> members;
  final bool? gameStageHasTable;
  final bool? hasNews;

  factory MatchDetailsModel.fromJson(Map<String, dynamic> json) {
    return MatchDetailsModel(
      id: json["id"],
      competitionId: json["competitionId"],
      seasonNum: json["seasonNum"],
      stageNum: json["stageNum"],
      roundNum: json["roundNum"],
      roundName: json["roundName"],
      competitionDisplayName: json["competitionDisplayName"],
      startTime: json['startTime'] as String?,
      statusGroup: json["statusGroup"],
      statusText: json["statusText"],
      shortStatusText: json["shortStatusText"],
      justEnded: json["justEnded"],
      gameTime: json["gameTime"],
      gameTimeDisplay: json["gameTimeDisplay"],
      hasLineups: json["hasLineups"],
      hasMissingPlayers: json["hasMissingPlayers"],
      hasFieldPositions: json["hasFieldPositions"],
      homeCompetitor: json["homeCompetitor"] == null
          ? null
          : MatchCompetitor.fromJson(json["homeCompetitor"]),
      awayCompetitor: json["awayCompetitor"] == null
          ? null
          : MatchCompetitor.fromJson(json["awayCompetitor"]),
      events: json["events"] == null
          ? []
          : List<Event>.from(json["events"]!.map((x) => Event.fromJson(x))),
      isHomeAwayInverted: json["isHomeAwayInverted"],
      hasStats: json["hasStats"],
      hasStandings: json["hasStandings"],
      standingsName: json["standingsName"],
      hasPreviousMeetings: json["hasPreviousMeetings"],
      venue: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
      officials: json["officials"] == null
          ? []
          : List<Official>.from(
              json["officials"]!.map((x) => Official.fromJson(x)),
            ),
      members: json["members"] == null
          ? []
          : List<Member>.from(json["members"]!.map((x) => Member.fromJson(x))),
      gameStageHasTable: json["gameStageHasTable"],
      hasNews: json["hasNews"],
    );
  }

  MatchDetailsEntity toEntity() {
    final Map<int, MemberEntity> membersMap = {
      for (var i in members) i.id ?? 0: i,
    };

    final List<EventsEntity> eventsList = [];
    for (var i in events) {
      eventsList.add(i.toEntity(membersMap));
    }

    return MatchDetailsEntity(
      matchId: id ?? 0,
      leagueId: competitionId ?? 0,
      leagueName: competitionDisplayName ?? '',
      leagueImage: ApiConst.leagueImage(competitionId ?? 0),
      homeTeamGoals: homeCompetitor?.score?.toInt() ?? 0,
      awayTeamGoals: awayCompetitor?.score?.toInt() ?? 0,
      minutes: gameTime?.toInt() ?? 0,
      matchStatus: shortStatusText ?? '',
      events: eventsList,
      homeLineUp: hasLineups ?? false
          ? homeCompetitor?.toEntity(membersMap)
          : null,
      awayLineUp: hasLineups ?? false
          ? awayCompetitor?.toEntity(membersMap)
          : null,
      hasLineups: hasLineups ?? false,
      hasStats: hasStats ?? false,
      hasStandings: hasStandings ?? false,
      info: InfoEntity(
        startTime: startTime ?? '',
        venueName: venue?.shortName ?? '',
        venueCapacity: venue?.capacity ?? 50000,
        officialName: officials.isNotEmpty ? officials[0].name! : 'Un Known',
      ),
    );
  }
}
