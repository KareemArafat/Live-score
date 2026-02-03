import 'package:equatable/equatable.dart';
import 'package:live_score_app/features/teams/data/models/squad_model/squad.dart';
import 'package:live_score_app/features/teams/domain/entities/squad_entity.dart';
import 'package:live_score_app/features/teams/domain/entities/squad_player_entity.dart';

class SquadModel extends Equatable {
  final List<Squad> squads;

  const SquadModel({required this.squads});

  factory SquadModel.fromJson(Map<String, dynamic> json) {
    return SquadModel(
      squads: json["squads"] == null
          ? []
          : List<Squad>.from(json["squads"]!.map((x) => Squad.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [squads];

  SquadEntity toEntity() {
    late SquadPlayerEntity coach;
    List<SquadPlayerEntity> goalkeepers = [];
    List<SquadPlayerEntity> defenders = [];
    List<SquadPlayerEntity> midfielders = [];
    List<SquadPlayerEntity> attackers = [];
    final players = squads[0].athletes;
    for (var player in players) {
      switch (player.positionId) {
        case 0:
          if (player.positionName == 'Coach') coach = player;
          break;
        case 1:
          goalkeepers.add(player);
          break;
        case 2:
          defenders.add(player);
          break;
        case 3:
          midfielders.add(player);
          break;
        case 4:
          attackers.add(player);
          break;
        default:
          break;
      }
    }
    return SquadEntity(
      coach: coach,
      goalkeepers: goalkeepers,
      defenders: defenders,
      midfielders: midfielders,
      attackers: attackers,
    );
  }
}
