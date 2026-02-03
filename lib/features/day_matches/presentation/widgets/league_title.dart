import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/core/widgets/custom_gradient_border.dart';
import 'package:live_score_app/core/widgets/custom_network_image.dart';
import 'package:live_score_app/features/leagues/domain/entities/league_entity.dart';

class LeagueTitle extends StatelessWidget {
  const LeagueTitle({super.key, required this.league});
  final LeagueEntity league;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: CustomGradientBorder(
        linearGradient: AppColors.blueGradient,
        border: 8,
        widget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
          child: Row(
            children: [
              CustomNetworkImage(imageUrl: league.leagueImage, size: 35),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  leagueNameSplit(league.leagueName),
                  style: AppStyles.heading16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
