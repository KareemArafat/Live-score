import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/app_routers.dart';
import 'package:live_score_app/features/fav%20teams/presentation/widgets/fav_icon.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';
import 'package:live_score_app/core/widgets/custom_gradient_border.dart';
import 'package:live_score_app/core/widgets/custom_network_image.dart';

class FavTeamCard extends StatelessWidget {
  const FavTeamCard({super.key, required this.team});
  final TeamEntity team;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouters.teamPage, extra: team),
      child: CustomGradientBorder(
        linearGradient: AppColors.blueGradient,
        border: 12,
        widget: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, top: 20, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomNetworkImage(imageUrl: team.teamImage, size: 50),
                    Spacer(),
                    FavIcon(team: team),
                  ],
                ),
                Spacer(),
                Text(team.teamName, style: AppStyles.heading16),
                SizedBox(height: 5),
                Row(
                  children: [
                    CustomNetworkImage(
                      imageUrl: ApiConst.leagueImage(team.leagueId!),
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(team.countryName!, style: AppStyles.body12),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
