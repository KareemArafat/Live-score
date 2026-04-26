import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_images.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/match_info_entity.dart';

class MatchInfo extends StatelessWidget {
  const MatchInfo({super.key, required this.info});
  final MatchInfoEntity info;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.blueGradient,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          _matchInfoItem(AppImages.schedule, info.startTime, context),
          _matchInfoItem(AppImages.stadium, info.venueName, context),
          _matchInfoItem(AppImages.referee, info.officialName, context),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _matchInfoItem(String image, String infoText, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(50),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(image),
          SizedBox(width: 15),
          Flexible(child: Text(infoText, style: AppStyles.body12(context))),
        ],
      ),
    );
  }
}
