import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/app_routers.dart';
import 'package:live_score_app/core/widgets/custom_network_image.dart';
import 'package:live_score_app/features/leagues/domain/entities/league_entity.dart';

class AllLeaguesListItem extends StatelessWidget {
  const AllLeaguesListItem({super.key, required this.leagueEntity});
  final LeagueEntity leagueEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => GoRouter.of(
        context,
      ).push(AppRouters.leagueDetailsPage, extra: leagueEntity),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          children: [
            CustomNetworkImage(imageUrl: leagueEntity.leagueImage, size: 30),
            SizedBox(width: 10),
            Text(leagueEntity.leagueName, style: AppStyles.heading16),
          ],
        ),
      ),
    );
  }
}
