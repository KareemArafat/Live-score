import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/fav%20teams/presentation/widgets/fav_icon.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';
import 'package:live_score_app/core/widgets/custom_network_image.dart';

class TeamPageTitle extends StatelessWidget {
  const TeamPageTitle({super.key, required this.team});
  final TeamEntity team;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Row(
        children: [
          CustomNetworkImage(imageUrl: team.teamImage, size: 60),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(team.teamName, style: AppStyles.heading18(context)),
              Text(
                team.countryName!,
                style: AppStyles.body12(context).copyWith(color: AppColors.grayColor),
              ),
            ],
          ),
          Spacer(),
          FavIcon(team: team),
        ],
      ),
    );
  }
}
