import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/leagues/domain/entities/league_stats_entity.dart';
import 'package:live_score_app/core/widgets/custom_network_image.dart';
import 'package:live_score_app/shard/widgets/player_image.dart';

class StatsGoalItem extends StatelessWidget {
  const StatsGoalItem({super.key, required this.player, required this.rank});
  final LeaguePlayersStatsEntity player;
  final int rank;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 15,
            child: Text(rank.toString(), style: AppStyles.body12),
          ),
          SizedBox(width: 5),
          PlayerImage(image: player.playerImage),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                player.playerName,
                style: AppStyles.body12.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  CustomNetworkImage(imageUrl: player.teamLogo, size: 12),
                  SizedBox(width: 2),
                  Text(player.teamName, style: AppStyles.grayBody10),
                ],
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: 40,
            child: Center(
              child: Text(player.goals.toString(), style: AppStyles.body12),
            ),
          ),
          SizedBox(width: 5),
          SizedBox(
            width: 50,
            child: Center(
              child: Text(player.penalties.toString(), style: AppStyles.body12),
            ),
          ),
        ],
      ),
    );
  }
}
