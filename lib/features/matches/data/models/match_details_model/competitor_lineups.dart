import 'package:live_score_app/features/matches/data/models/match_details_model/lineups_member.dart';

class CompetitorLineups {
  CompetitorLineups({
    required this.status,
    required this.formation,
    required this.hasFieldPositions,
    required this.members,
  });

  final String? status;
  final String? formation;
  final bool? hasFieldPositions;
  final List<LineupsMember> members;

  factory CompetitorLineups.fromJson(Map<String, dynamic> json) {
    return CompetitorLineups(
      status: json["status"],
      formation: json["formation"],
      hasFieldPositions: json["hasFieldPositions"],
      members: json["members"] == null
          ? []
          : List<LineupsMember>.from(
              json["members"]!.map((x) => LineupsMember.fromJson(x)),
            ),
    );
  }
}
