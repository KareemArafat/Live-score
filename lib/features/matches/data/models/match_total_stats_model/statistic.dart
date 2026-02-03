import 'package:live_score_app/features/matches/domain/entities/match_total_stats_entity/match_stat_entity.dart';

class Statistic extends MatchStatEntity {
  Statistic({
    required this.id,
    required this.name,
    required this.competitorId,
    required this.isMajor,
    required this.value,
    required this.valuePercentage,
    required this.isPrimary,
    required this.order,
    required this.markedTeam,
    required this.isTop,
    required this.categoryId,
    required this.categoryName,
    required this.categoryOrder,
  }) : super(
         teamId: competitorId ?? 0,
         statId: id ?? 0,
         statName: name ?? '',
         statValue: value ?? '0',
         statePercent: valuePercentage ?? 0.5,
       );

  final int? id;
  final String? name;
  final int? competitorId;
  final bool? isMajor;
  final String? value;
  final double? valuePercentage;
  final bool? isPrimary;
  final int? order;
  final int? markedTeam;
  final bool? isTop;
  final int? categoryId;
  final String? categoryName;
  final int? categoryOrder;

  factory Statistic.fromJson(Map<String, dynamic> json) {
    return Statistic(
      id: json["id"],
      name: json["name"],
      competitorId: json["competitorId"],
      isMajor: json["isMajor"],
      value: json["value"],
      valuePercentage: json["valuePercentage"],
      isPrimary: json["isPrimary"],
      order: json["order"],
      markedTeam: json["markedTeam"],
      isTop: json["isTop"],
      categoryId: json["categoryId"],
      categoryName: json["categoryName"],
      categoryOrder: json["categoryOrder"],
    );
  }
}
