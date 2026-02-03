import 'package:live_score_app/features/matches/domain/entities/match_details_entity/lineup_member_entity.dart';

class LineupEntity {
  final int teamId;
  final String teamName;
  final String lineupStatus;
  final String lineupFormation;
  final LineupMemberEntity coach;
  final LineupMemberEntity goalKeeper;
  final List<LineupMemberEntity> line2;
  final List<LineupMemberEntity> line3;
  final List<LineupMemberEntity> line4;
  final List<LineupMemberEntity>? line5;
  final List<LineupMemberEntity>? substitutions;

  LineupEntity({
    required this.teamId,
    required this.teamName,
    required this.lineupStatus,
    required this.lineupFormation,
    required this.coach,
    required this.goalKeeper,
    required this.line2,
    required this.line3,
    required this.line4,
    required this.line5,
    required this.substitutions,
  });
}
