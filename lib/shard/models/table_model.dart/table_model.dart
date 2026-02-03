import 'package:live_score_app/shard/entities/table_entity.dart';
import 'package:live_score_app/shard/models/table_model.dart/season_filter.dart';
import 'package:live_score_app/shard/models/table_model.dart/standing.dart';

class TableModel extends TableEntity {
  TableModel({
    required this.lastUpdateId,
    required this.requestedUpdateId,
    required this.ttl,
    required this.standings,
    required this.seasonsFilter,
  }) : super(
         rows: standings[0].rows,
         seasons: seasonsFilter,
         currentSeason: standings[0].seasonNum ?? 0,
       );

  final int? lastUpdateId;
  final int? requestedUpdateId;
  final int? ttl;
  final List<Standing> standings;
  final List<SeasonsFilter> seasonsFilter;

  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(
      lastUpdateId: json["lastUpdateId"],
      requestedUpdateId: json["requestedUpdateId"],
      ttl: json["ttl"],
      standings: json["standings"] == null
          ? []
          : List<Standing>.from(
              json["standings"]!.map((x) => Standing.fromJson(x)),
            ),

      seasonsFilter: json["seasonsFilter"] == null
          ? []
          : List<SeasonsFilter>.from(
              json["seasonsFilter"]!.map((x) => SeasonsFilter.fromJson(x)),
            ),
    );
  }
}
