import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_images.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/lineup_member_entity.dart';
import 'package:live_score_app/shard/widgets/player_image.dart';
import 'package:live_score_app/features/matches/presentation/widgets/lineup_player_score.dart';

class LineupPlayer extends StatelessWidget {
  const LineupPlayer({super.key, required this.player, this.isBench = false});
  final LineupMemberEntity player;
  final bool isBench;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            PlayerImage(image: player.playerImage),
            Positioned(
              left: 22,
              top: -8,
              child: Container(
                height: 15,
                width: 25,
                decoration: BoxDecoration(
                  color: player.rate >= 5
                      ? Colors.orangeAccent
                      : Colors.redAccent,
                  gradient: player.rate >= 7 ? AppColors.greenGradient : null,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(player.rate.toString(), style: AppStyles.body10),
                ),
              ),
            ),
            Positioned(
              right: -4,
              bottom: 12,
              child: Image.asset(AppImages.redCard, height: 10),
            ),
            Positioned(
              left: -4,
              bottom: 12,
              child: Image.asset(AppImages.yellowCard, height: 10),
            ),
            Positioned(
              left: -6,
              top: -6,
              child: Image.asset(AppImages.substitution, height: 12),
            ),
            Positioned(
              left: 22,
              bottom: -4,
              child: LineupPlayerScore(image: AppImages.score),
            ),
            Positioned(
              right: 22,
              bottom: -4,
              child: LineupPlayerScore(image: AppImages.assist),
            ),
          ],
        ),
        SizedBox(height: 4),
        if (!isBench)
          SizedBox(
            width: 65,
            child: Center(
              child: Text(
                player.playerName,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.blockBody10,
              ),
            ),
          ),
      ],
    );
  }
}
