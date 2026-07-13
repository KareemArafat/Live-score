import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/widgets/custom_gradient_border.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:live_score_app/shard/entities/match_status.dart';

class MatchResultRowState extends StatelessWidget {
  const MatchResultRowState({super.key, required this.matchEntity});
  final MatchEntity matchEntity;

  @override
  Widget build(BuildContext context) {
    final matchTimeFormat = DateTime.parse(matchEntity.date).toLocal();
    final matchTime = DateFormat('h:mm a').format(matchTimeFormat);
    final matchStatus = MatchStatus()
      ..getMatchStatus(matchEntity.status, matchEntity.minutes, matchTime);

    return matchStatus.circleActive!
        ? Row(
            children: [
              SizedBox(
                width: context.w(16),
                child: Text(
                  textAlign: TextAlign.center,
                  matchEntity.homeTeamGoals.toString(),
                  style: AppStyles.body10(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              CustomGradientBorder(
                linearGradient: AppColors.greenGradient,
                border: 100,
                height: context.rMin(30),
                width: context.rMin(30),
                child: Center(
                  child: Text(
                    matchStatus.text!,
                    style: AppStyles.body8(context),
                  ),
                ),
              ),
              SizedBox(
                width: context.w(16),
                child: Text(
                  textAlign: TextAlign.center,
                  matchEntity.awayTeamGoals.toString(),
                  style: AppStyles.body10(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )
        : Text(matchStatus.text!, style: AppStyles.grayBody10(context));
  }
}
