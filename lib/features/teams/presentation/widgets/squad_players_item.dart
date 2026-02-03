import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/teams/domain/entities/squad_player_entity.dart';
import 'package:live_score_app/core/widgets/custom_network_image.dart';
import 'package:live_score_app/shard/widgets/player_image.dart';

class SquadPlayersItem extends StatelessWidget {
  const SquadPlayersItem({
    super.key,
    required this.player,
    this.isCoach = false,
  });
  final SquadPlayerEntity player;
  final bool isCoach;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      visualDensity: const VisualDensity(vertical: -4),
      dense: true,
      leading: PlayerImage(image: player.playerPhoto, isCoach: isCoach),
      title: Text(
        player.playerName,
        style: AppStyles.body12.copyWith(fontWeight: FontWeight.w500),
      ),
      subtitle: Row(
        children: [
          CustomNetworkImage(imageUrl: player.countryFlag, size: 12),
          SizedBox(width: 2),
          Text(player.countryName, style: AppStyles.grayBody10),
        ],
      ),
      trailing: player.playerNumber != 0
          ? Text(player.playerNumber.toString(), style: AppStyles.body12)
          : null,
    );
  }
}
