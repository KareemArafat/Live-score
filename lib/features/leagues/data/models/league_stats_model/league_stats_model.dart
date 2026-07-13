import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/features/leagues/data/models/league_stats_model/players_stats.dart';
import 'package:live_score_app/features/leagues/domain/entities/league_stats_entity/league_stats_entity.dart';
import 'package:live_score_app/shard/models/team_model.dart';

class LeagueStatsModel {
  final PlayersStats? playersStats;
  final List<TeamModel>? competitors;

  LeagueStatsModel({required this.playersStats, required this.competitors});

  factory LeagueStatsModel.fromJson(Map<String, dynamic> json) =>
      LeagueStatsModel(
        playersStats: json['stats'] == null
            ? null
            : PlayersStats.fromJson(json['stats']),
        competitors: json["competitors"] == null
            ? []
            : List<TeamModel>.from(
                json["competitors"].map((x) => TeamModel.fromJson(x)),
              ),
      );

  LeagueStatsEntity toEntity() {
    final teamsMap = {for (var i in competitors!) i.id: i};
    final goalsList = playersStats!.athletesStats[0].rows.map((player) {
      final team = teamsMap[player.teamId];
      return player.copyWith(
        teamName: team!.name ?? '',
        teamLogo: ApiConst.teamImage(team.id!),
      );
    }).toList();
    final assistsList = playersStats!.athletesStats[2].rows.map((player) {
      final team = teamsMap[player.teamId];
      return player.copyWith(
        teamName: team!.name ?? '',
        teamLogo: ApiConst.teamImage(team.id!),
      );
    }).toList();

    return LeagueStatsEntity(goals: goalsList, assists: assistsList);
  }
}
