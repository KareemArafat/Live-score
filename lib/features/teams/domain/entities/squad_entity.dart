import 'package:equatable/equatable.dart';
import 'package:live_score_app/features/teams/domain/entities/squad_player_entity.dart';

class SquadEntity extends Equatable {
  final SquadPlayerEntity coach;
  final List<SquadPlayerEntity> goalkeepers;
  final List<SquadPlayerEntity> defenders;
  final List<SquadPlayerEntity> midfielders;
  final List<SquadPlayerEntity> attackers;

  const SquadEntity({
    required this.coach,
    required this.goalkeepers,
    required this.defenders,
    required this.midfielders,
    required this.attackers,
  });

  @override
  List<Object?> get props => [
    coach,
    goalkeepers,
    defenders,
    midfielders,
    attackers,
  ];
}
