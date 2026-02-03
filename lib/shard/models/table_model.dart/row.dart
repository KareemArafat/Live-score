import 'package:live_score_app/shard/entities/table_entity.dart';
import 'package:live_score_app/shard/models/competitor_model.dart';

class Row extends RowEntity {
  Row({
    required this.competitor,
    required this.gamePlayed,
    required this.gamesWon,
    required this.gamesLost,
    required this.gamesEven,
    required this.rowFor,
    required this.against,
    required this.ratio,
    required this.points,
    required this.strike,
    required this.gamesOt,
    required this.gamesWonOnOt,
    required this.gamesWonOnPen,
    required this.gamesLossOnOt,
    required this.gamesLossOnPen,
    required this.pct,
    required this.position,
    required this.trend,
    required this.recentForm,
    required this.destinationNum,
    required this.hasPointsDeduction,
    required this.ppg,
    required this.oppg,
  }) : super(
         team: competitor,
         teamRank: position ?? 0,
         matchesNum: gamePlayed ?? 0,
         wins: gamesWon ?? 0,
         loses: gamesLost ?? 0,
         draws: gamesEven?.toInt() ?? 0,
         scored: rowFor?.toInt() ?? 0,
         accepted: against?.toInt() ?? 0,
         diff: ratio?.toInt() ?? 0,
         totalPoints: points?.toInt() ?? 0,
       );

  final CompetitorModel? competitor;
  final int? gamePlayed;
  final int? gamesWon;
  final int? gamesLost;
  final num? gamesEven;
  final num? rowFor;
  final num? against;
  final num? ratio;
  final num? points;
  final num? strike;
  final num? gamesOt;
  final num? gamesWonOnOt;
  final num? gamesWonOnPen;
  final num? gamesLossOnOt;
  final num? gamesLossOnPen;
  final String? pct;
  final int? position;
  final num? trend;
  final List<int> recentForm;
  final num? destinationNum;
  final bool? hasPointsDeduction;
  final num? ppg;
  final num? oppg;

  factory Row.fromJson(Map<String, dynamic> json) {
    return Row(
      competitor: json["competitor"] == null
          ? null
          : CompetitorModel.fromJson(json["competitor"]),
      gamePlayed: json["gamePlayed"],
      gamesWon: json["gamesWon"],
      gamesLost: json["gamesLost"],
      gamesEven: json["gamesEven"],
      rowFor: json["for"],
      against: json["against"],
      ratio: json["ratio"],
      points: json["points"],
      strike: json["strike"],
      gamesOt: json["gamesOT"],
      gamesWonOnOt: json["gamesWonOnOT"],
      gamesWonOnPen: json["gamesWonOnPen"],
      gamesLossOnOt: json["gamesLossOnOT"],
      gamesLossOnPen: json["gamesLossOnPen"],
      pct: json["pct"],
      position: json["position"],
      trend: json["trend"],
      recentForm: json["recentForm"] == null
          ? []
          : List<int>.from(json["recentForm"]!.map((x) => x)),
      destinationNum: json["destinationNum"],
      hasPointsDeduction: json["hasPointsDeduction"],
      ppg: json["ppg"],
      oppg: json["oppg"],
    );
  }
}
