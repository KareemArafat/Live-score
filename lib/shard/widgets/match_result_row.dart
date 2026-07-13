import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/utils/app_routers.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:live_score_app/core/widgets/custom_network_image.dart';
import 'package:live_score_app/shard/widgets/match_result_row_state.dart';

class MatchResultRow extends StatelessWidget {
  const MatchResultRow({super.key, required this.matchEntity});
  final MatchEntity matchEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () =>
          GoRouter.of(context).push(AppRouters.matchPage, extra: matchEntity),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          children: [
            CustomNetworkImage(
              imageUrl: matchEntity.homeTeam.teamImage,
              size: context.rMin(16),
            ),
            SizedBox(width: 3),
            SizedBox(
              width: context.screenWidth / 3.5,
              child: Text(
                matchEntity.homeTeam.teamName,
                style: AppStyles.body10(context),
              ),
            ),
            Spacer(),
            MatchResultRowState(matchEntity: matchEntity),
            Spacer(),
            SizedBox(
              width: context.screenWidth / 3.5,
              child: Text(
                textAlign: TextAlign.right,
                matchEntity.awayTeam.teamName,
                style: AppStyles.body10(context),
              ),
            ),
            SizedBox(width: 3),
            CustomNetworkImage(
              imageUrl: matchEntity.awayTeam.teamImage,
              size: context.rMin(16),
            ),
          ],
        ),
      ),
    );
  }
}
