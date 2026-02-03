import 'package:equatable/equatable.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';

class TableEntity {
  final List<RowEntity> rows;
  final List<SeasonEntity> seasons;
  final int currentSeason;
  const TableEntity({
    required this.rows,
    required this.seasons,
    required this.currentSeason,
  });
}

class RowEntity {
  final TeamEntity? team;
  final int teamRank;
  final int matchesNum;
  final int wins;
  final int loses;
  final int draws;
  final int scored;
  final int accepted;
  final int diff;
  final int totalPoints;
  const RowEntity({
    required this.team,
    required this.teamRank,
    required this.matchesNum,
    required this.wins,
    required this.loses,
    required this.draws,
    required this.scored,
    required this.accepted,
    required this.diff,
    required this.totalPoints,
  });
}

class SeasonEntity extends Equatable {
  final int num;
  final String name;
  const SeasonEntity({required this.num, required this.name});

  @override
  List<Object?> get props => [num, name];
}
