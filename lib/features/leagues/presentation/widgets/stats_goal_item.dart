import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/leagues/domain/entities/league_stats_entity/league_player_states_entity.dart';
import 'package:live_score_app/core/widgets/custom_network_image.dart';
import 'package:live_score_app/shard/widgets/player_image.dart';

class StatsGoalItem extends StatelessWidget {
  const StatsGoalItem({super.key, required this.player, required this.rank});
  final LeaguePlayersStatsEntity player;
  final int rank;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.h(12)),
      child: Row(
        children: [
          SizedBox(
            width: context.w(16),
            child: Text(rank.toString(), style: AppStyles.body12(context)),
          ),
          SizedBox(width: context.w(6)),
          PlayerImage(image: player.playerImage, radius: context.rMin(15)),
          SizedBox(width: context.w(6)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                player.playerName,
                style: AppStyles.body12(
                  context,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: context.h(2)),
              Row(
                children: [
                  CustomNetworkImage(
                    imageUrl: player.teamLogo,
                    size: context.rMin(10),
                  ),
                  SizedBox(width: context.w(2)),
                  Text(player.teamName, style: AppStyles.grayBody10(context)),
                ],
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: context.w(50),
            child: Center(
              child: Text(
                player.goals.toString(),
                style: AppStyles.body12(context),
              ),
            ),
          ),
          SizedBox(width: context.w(6)),
          SizedBox(
            width: context.w(50),
            child: Center(
              child: Text(
                player.penalties.toString(),
                style: AppStyles.body12(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
