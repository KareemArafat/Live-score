import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/enums.dart';
import 'package:live_score_app/core/widgets/custom_gradient_border.dart';

class MatchResultState extends StatelessWidget {
  const MatchResultState({
    super.key,
    required this.radius,
    required this.status,
    required this.homeGoals,
    required this.awayGoals,
    required this.time,
    required this.minutes,
  });

  final double radius;
  final String status;
  final int homeGoals;
  final int awayGoals;
  final String time;
  final int? minutes;

  String _getMatchState() {
    if (status == MatchStatusEnum.firstHalf.value ||
        status == MatchStatusEnum.secondHalf.value) {
      return '$minutes\'';
    } else if (status == MatchStatusEnum.halfTime.value) {
      return 'HT';
    } else if (status == MatchStatusEnum.ended.value ||
        status == MatchStatusEnum.justEnded.value) {
      return 'FT';
    } else if (status == MatchStatusEnum.afterPenalties.value) {
      return 'Pen';
    } else if (status == MatchStatusEnum.afterET.value) {
      return 'AET';
    }
    return status;
  }

  @override
  Widget build(BuildContext context) {
    List<String> matchPlayedStats = [
      MatchStatusEnum.firstHalf.value,
      MatchStatusEnum.halfTime.value,
      MatchStatusEnum.secondHalf.value,
      MatchStatusEnum.afterET.value,
      MatchStatusEnum.afterPenalties.value,
      MatchStatusEnum.justEnded.value,
      MatchStatusEnum.ended.value,
    ];

    return matchPlayedStats.contains(status)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 18,
                child: Text(
                  textAlign: TextAlign.center,
                  homeGoals.toString(),
                  style: AppStyles.body12(context).copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              CustomGradientBorder(
                linearGradient: AppColors.greenGradient,
                border: 18,
                height: radius,
                width: radius,
                child: Center(
                  child: Text(_getMatchState(), style: AppStyles.body10(context)),
                ),
              ),
              SizedBox(
                width: 18,
                child: Text(
                  textAlign: TextAlign.center,
                  awayGoals.toString(),
                  style: AppStyles.body12(context).copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )
        : Text(
            status == 'Scheduled' ? time : status,
            style: AppStyles.grayBody10(context),
          );
  }
}
