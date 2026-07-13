import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_images.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/events_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/lineup_member_entity.dart';
import 'package:live_score_app/shard/widgets/player_image.dart';
import 'package:live_score_app/features/matches/presentation/widgets/lineup_player_score.dart';

class LineupPlayer extends StatelessWidget {
  const LineupPlayer({super.key, required this.player, required this.events});
  final LineupMemberEntity player;
  final List<EventEntity> events;

  bool getPlayerStat(String statName) {
    for (var event in events) {
      if (event.eventName == statName &&
          (player.playerId == event.playerId ||
              player.playerId == event.extraPlayerId)) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final radius = context.rMin(20);
    final size = radius * 2;

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            PlayerImage(image: player.playerImage, radius: radius),
            if (player.rate > -1)
              Positioned(
                left: size * 0.6,
                top: -size * 0.2,
                child: Container(
                  height: context.rMin(16),
                  width: context.w(24),
                  decoration: BoxDecoration(
                    color: player.rate >= 5
                        ? Colors.orangeAccent
                        : Colors.redAccent,
                    gradient: player.rate >= 7 ? AppColors.greenGradient : null,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      player.rate.toString(),
                      style: AppStyles.body8(context),
                    ),
                  ),
                ),
              ),

            if (getPlayerStat('Red Card'))
              Positioned(
                right: -size * 0.2,
                bottom: size * 0.33,
                child: Image.asset(AppImages.redCard, height: size * 0.3),
              ),

            if (getPlayerStat('Yellow Card'))
              Positioned(
                left: -size * 0.2,
                bottom: size * 0.33,
                child: Image.asset(AppImages.yellowCard, height: size * 0.3),
              ),

            if (getPlayerStat('Substitution'))
              Positioned(
                left: -size * 0.2,
                top: -size * 0.2,
                child: Image.asset(AppImages.substitution, height: size * 0.5),
              ),

            if (player.getStat('Goals') > 0)
              Positioned(
                left: size * 0.7,
                bottom: -size * 0.12,
                child: LineupPlayerScore(
                  image: AppImages.score,
                  num: player.getStat('Goals'),
                  isLeft: true,
                ),
              ),

            if (player.getStat('Assists') > 0)
              Positioned(
                right: size * 0.7,
                bottom: -size * 0.12,
                child: LineupPlayerScore(
                  image: AppImages.assist,
                  num: player.getStat('Assists'),
                  isLeft: false,
                ),
              ),
          ],
        ),

        const SizedBox(height: 8),

        if (!player.isBench)
          SizedBox(
            width: size * 1.8,
            child: Center(
              child: Text(
                maxLines: 1,
                player.playerShortName,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.blockBody10(context),
              ),
            ),
          ),
      ],
    );
  }
}
