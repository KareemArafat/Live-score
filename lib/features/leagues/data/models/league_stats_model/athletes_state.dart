import 'package:equatable/equatable.dart';
import 'package:live_score_app/features/leagues/data/models/league_stats_model/athletes_stat_row.dart';
import 'package:live_score_app/features/leagues/data/models/league_stats_model/stats_type.dart';

class AthletesStat extends Equatable {
  const AthletesStat({
    required this.id,
    required this.name,
    required this.competitionId,
    required this.rows,
    required this.statsTypes,
  });

  final int? id;
  final String? name;
  final num? competitionId;
  final List<AthletesStatRow> rows;
  final List<StatsType> statsTypes;

  factory AthletesStat.fromJson(Map<String, dynamic> json) {
    return AthletesStat(
      id: json["id"],
      name: json["name"],
      competitionId: json["competitionId"],
      rows: json["rows"] == null
          ? []
          : List<AthletesStatRow>.from(
              json["rows"]!.map((x) => AthletesStatRow.fromJson(x)),
            ),
      statsTypes: json["statsTypes"] == null
          ? []
          : List<StatsType>.from(
              json["statsTypes"]!.map((x) => StatsType.fromJson(x)),
            ),
    );
  }

  @override
  List<Object?> get props => [id, name, competitionId, rows, statsTypes];
}
