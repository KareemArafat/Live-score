import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/widgets/custom_gradient_border.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/match_details_entity.dart';
import 'package:live_score_app/shard/entities/match_status.dart';

class MatchDetailsSectionState extends StatelessWidget {
  const MatchDetailsSectionState({super.key, required this.matchEntity});
  final MatchDetailsEntity matchEntity;

  @override
  Widget build(BuildContext context) {
    final matchTimeFormat = DateTime.parse(
      matchEntity.info.startTime,
    ).toLocal();
    final matchTime = DateFormat('h:mm a').format(matchTimeFormat);
    final matchStatus = MatchStatus()
      ..getMatchStatus(matchEntity.matchStatus, matchEntity.minutes, matchTime);

    return matchStatus.circleActive!
        ? Row(
            children: [
              SizedBox(
                width: context.w(40),
                child: Text(
                  textAlign: TextAlign.center,
                  matchEntity.homeTeamGoals.toString(),
                  style: AppStyles.body14(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              CustomGradientBorder(
                linearGradient: AppColors.greenGradient,
                border: 100,
                height: context.rMin(40),
                width: context.rMin(40),
                child: Center(
                  child: Text(
                    matchStatus.text!,
                    style: AppStyles.body10(context),
                  ),
                ),
              ),
              SizedBox(
                width: context.w(40),
                child: Text(
                  textAlign: TextAlign.center,
                  matchEntity.awayTeamGoals.toString(),
                  style: AppStyles.body14(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )
        : Text(matchStatus.text!, style: AppStyles.grayBody12(context));
  }
}
