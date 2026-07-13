import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_images.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/match_info_entity.dart';
import 'package:live_score_app/features/matches/presentation/widgets/match_info_item.dart';

class MatchInfo extends StatelessWidget {
  const MatchInfo({super.key, required this.matchInfoEntity});
  final MatchInfoEntity matchInfoEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.blueGradient,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          MatchInfoItem(
            image: AppImages.schedule,
            infoText: matchInfoEntity.startTime,
          ),
          MatchInfoItem(
            image: matchInfoEntity.leagueImage,
            infoText: matchInfoEntity.leagueName,
            isLeague: true,
          ),
          if (matchInfoEntity.venueName != null)
            MatchInfoItem(
              image: AppImages.stadium,
              infoText: matchInfoEntity.venueName!,
            ),
          if (matchInfoEntity.officialName != null)
            MatchInfoItem(
              image: AppImages.referee,
              infoText: matchInfoEntity.officialName!,
            ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
