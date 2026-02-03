import 'package:live_score_app/shard/entities/table_entity.dart';

class SeasonsFilter extends SeasonEntity {
  const SeasonsFilter({required this.seasonNum, required this.seasonName})
    : super(num: seasonNum ?? 0, name: seasonName ?? '');

  final int? seasonNum;
  final String? seasonName;

  factory SeasonsFilter.fromJson(Map<String, dynamic> json) {
    return SeasonsFilter(
      seasonNum: json["seasonNum"],
      seasonName: json["seasonName"],
    );
  }
}
