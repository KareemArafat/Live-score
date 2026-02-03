import 'package:equatable/equatable.dart';
import 'package:live_score_app/shard/models/table_model.dart/destination.dart';
import 'package:live_score_app/shard/models/table_model.dart/row.dart';

class Standing extends Equatable {
  const Standing({
    required this.competitionId,
    required this.seasonNum,
    required this.stageNum,
    required this.isCurrentStage,
    required this.displayName,
    required this.currentGroupCategory,
    required this.rows,
    required this.destinations,
  });

  final int? competitionId;
  final int? seasonNum;
  final int? stageNum;
  final bool? isCurrentStage;
  final String? displayName;
  final int? currentGroupCategory;
  final List<Row> rows;
  final List<Destination> destinations;

  factory Standing.fromJson(Map<String, dynamic> json) {
    return Standing(
      competitionId: json["competitionId"],
      seasonNum: json["seasonNum"],
      stageNum: json["stageNum"],
      isCurrentStage: json["isCurrentStage"],
      displayName: json["displayName"],
      currentGroupCategory: json["currentGroupCategory"],

      rows: json["rows"] == null
          ? []
          : List<Row>.from(json["rows"]!.map((x) => Row.fromJson(x))),
      destinations: json["destinations"] == null
          ? []
          : List<Destination>.from(
              json["destinations"]!.map((x) => Destination.fromJson(x)),
            ),
    );
  }

  @override
  List<Object?> get props => [
    competitionId,
    seasonNum,
    stageNum,
    isCurrentStage,
    displayName,
    currentGroupCategory,
    rows,
    destinations,
  ];
}
