import 'package:equatable/equatable.dart';
import 'package:live_score_app/features/leagues/data/models/league_stats_model/stat.dart';
import 'package:live_score_app/features/leagues/data/models/league_stats_model/stats_type.dart';

class CompetitorsStat extends Equatable {
  const CompetitorsStat({
    required this.id,
    required this.name,
    required this.competitionId,
    required this.averageStat,
    required this.rows,
    required this.statsTypes,
  });

  final int? id;
  final String? name;
  final num? competitionId;
  final AverageStat? averageStat;
  final List<CompetitorsStatRow> rows;
  final List<StatsType> statsTypes;

  factory CompetitorsStat.fromJson(Map<String, dynamic> json) {
    return CompetitorsStat(
      id: json["id"],
      name: json["name"],
      competitionId: json["competitionId"],
      averageStat: json["averageStat"] == null
          ? null
          : AverageStat.fromJson(json["averageStat"]),
      rows: json["rows"] == null
          ? []
          : List<CompetitorsStatRow>.from(
              json["rows"]!.map((x) => CompetitorsStatRow.fromJson(x)),
            ),
      statsTypes: json["statsTypes"] == null
          ? []
          : List<StatsType>.from(
              json["statsTypes"]!.map((x) => StatsType.fromJson(x)),
            ),
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    competitionId,
    averageStat,
    rows,
    statsTypes,
  ];
}

class AverageStat extends Equatable {
  const AverageStat({required this.text, required this.value});

  final String? text;
  final String? value;

  factory AverageStat.fromJson(Map<String, dynamic> json) {
    return AverageStat(text: json["text"], value: json["value"]);
  }

  @override
  List<Object?> get props => [text, value];
}

class CompetitorsStatRow extends Equatable {
  const CompetitorsStatRow({
    required this.position,
    required this.secondaryStatName,
    required this.entity,
    required this.stats,
  });

  final num? position;
  final String? secondaryStatName;
  final FluffyEntity? entity;
  final List<Stat> stats;

  factory CompetitorsStatRow.fromJson(Map<String, dynamic> json) {
    return CompetitorsStatRow(
      position: json["position"],
      secondaryStatName: json["secondaryStatName"],
      entity: json["entity"] == null
          ? null
          : FluffyEntity.fromJson(json["entity"]),
      stats: json["stats"] == null
          ? []
          : List<Stat>.from(json["stats"]!.map((x) => Stat.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [position, secondaryStatName, entity, stats];
}

class FluffyEntity extends Equatable {
  const FluffyEntity({
    required this.id,
    required this.name,
    required this.shortName,
    required this.countryId,
    required this.countryName,
    required this.competitorId,
    required this.competitionId,
  });

  final int? id;
  final String? name;
  final String? shortName;
  final num? countryId;
  final String? countryName;
  final num? competitorId;
  final num? competitionId;

  factory FluffyEntity.fromJson(Map<String, dynamic> json) {
    return FluffyEntity(
      id: json["id"],
      name: json["name"],
      shortName: json["shortName"],
      countryId: json["countryId"],
      countryName: json["countryName"],
      competitorId: json["competitorId"],
      competitionId: json["competitionId"],
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    shortName,
    countryId,
    countryName,
    competitorId,
    competitionId,
  ];
}
