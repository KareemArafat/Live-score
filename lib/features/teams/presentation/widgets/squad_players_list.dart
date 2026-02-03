import 'package:flutter/material.dart';
import 'package:live_score_app/features/teams/domain/entities/squad_player_entity.dart';
import 'package:live_score_app/features/teams/presentation/widgets/squad_players_item.dart';

class SquadPlayersList extends StatelessWidget {
  const SquadPlayersList({super.key, required this.players});
  final List<SquadPlayerEntity> players;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: players.length,
      itemBuilder: (context, index) => SquadPlayersItem(player: players[index]),
    );
  }
}
