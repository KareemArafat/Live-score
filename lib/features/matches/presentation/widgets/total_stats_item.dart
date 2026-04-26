import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/matches/domain/entities/match_total_stats_entity/match_stat_entity.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TotalStatsItem extends StatelessWidget {
  const TotalStatsItem({
    super.key,
    required this.homeTeamStats,
    required this.awayTeamStats,
  });
  final MatchStatEntity homeTeamStats;
  final MatchStatEntity awayTeamStats;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(homeTeamStats.statName, style: AppStyles.body10(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
                child: Text(homeTeamStats.statValue, style: AppStyles.body10(context)),
              ),
              SizedBox(width: 5),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                  child: StepProgressIndicator(
                    progressDirection: TextDirection.rtl,
                    totalSteps: 100,
                    currentStep: (homeTeamStats.statePercent * 100).toInt(),
                    size: 8,
                    padding: 0,
                    unselectedColor: Colors.grey.shade300,
                    selectedGradientColor: AppColors.blueGradient,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.zero,
                    bottomLeft: Radius.zero,
                  ),
                  child: StepProgressIndicator(
                    totalSteps: 100,
                    currentStep: (awayTeamStats.statePercent * 100).toInt(),
                    size: 8,
                    padding: 0,
                    unselectedColor: Colors.grey.shade300,
                    selectedGradientColor: AppColors.greenGradient,
                  ),
                ),
              ),
              SizedBox(width: 5),
              SizedBox(
                width: 30,
                child: Text(
                  textAlign: TextAlign.end,
                  awayTeamStats.statValue,
                  style: AppStyles.body10(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
