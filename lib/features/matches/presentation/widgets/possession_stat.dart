import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PossessionStat extends StatelessWidget {
  const PossessionStat({
    super.key,
    required this.homeTeamPossession,
    required this.awayTeamPossession,
  });
  final String homeTeamPossession;
  final String awayTeamPossession;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          CircularPercentIndicator(
            linearGradient: AppColors.blueGradient,
            radius: 30,
            lineWidth: 6,
            animation: true,
            percent: parsePercentage(homeTeamPossession),
            center: Text(
              homeTeamPossession,
              style: AppStyles.body14.copyWith(fontWeight: FontWeight.w600),
            ),
            circularStrokeCap: CircularStrokeCap.round,
          ),

          Spacer(),
          Text(
            'Possession',
            style: AppStyles.body14.copyWith(fontWeight: FontWeight.w600),
          ),
          Spacer(),
          CircularPercentIndicator(
            reverse: true,
            linearGradient: AppColors.greenGradient,
            radius: 30,
            lineWidth: 6,
            animation: true,
            percent: parsePercentage(awayTeamPossession),
            center: Text(
              awayTeamPossession,
              style: AppStyles.body14.copyWith(fontWeight: FontWeight.w600),
            ),
            circularStrokeCap: CircularStrokeCap.round,
          ),
        ],
      ),
    );
  }

  double parsePercentage(String percentage) {
    return double.parse(percentage.replaceAll('%', '')) / 100;
  }
}
