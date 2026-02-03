import 'package:equatable/equatable.dart';
import 'package:live_score_app/features/teams/data/models/squad_model/athlete.dart';

class Squad extends Equatable {
  const Squad({required this.competitorId, required this.athletes});

  final int? competitorId;
  final List<Athlete> athletes;

  factory Squad.fromJson(Map<String, dynamic> json) {
    return Squad(
      competitorId: json["competitorId"],
      athletes: json["athletes"] == null
          ? []
          : List<Athlete>.from(
              json["athletes"]!.map((x) => Athlete.fromJson(x)),
            ),
    );
  }

  @override
  List<Object?> get props => [competitorId, athletes];
}
