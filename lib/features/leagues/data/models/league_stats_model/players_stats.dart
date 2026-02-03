import 'package:equatable/equatable.dart';
import 'package:live_score_app/features/leagues/data/models/league_stats_model/athletes_state.dart';
import 'package:live_score_app/features/leagues/data/models/league_stats_model/competitors_stats.dart';

class PlayersStats extends Equatable {
  final List<AthletesStat> athletesStats;
  final List<CompetitorsStat> competitorsStats;
  final String? athletesInfoText;

  const PlayersStats({
    required this.athletesStats,
    required this.competitorsStats,
    required this.athletesInfoText,
  });

  factory PlayersStats.fromJson(Map<String, dynamic> json) {
    return PlayersStats(
      athletesStats: json["athletesStats"] == null
          ? []
          : List<AthletesStat>.from(
              json["athletesStats"]!.map((x) => AthletesStat.fromJson(x)),
            ),
      competitorsStats: json["competitorsStats"] == null
          ? []
          : List<CompetitorsStat>.from(
              json["competitorsStats"]!.map((x) => CompetitorsStat.fromJson(x)),
            ),
      athletesInfoText: json["athletesInfoText"],
    );
  }

  @override
  List<Object?> get props => [
    athletesStats,
    competitorsStats,
    athletesInfoText,
  ];
}
