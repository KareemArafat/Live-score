import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:live_score_app/core/utils/app_routers.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:live_score_app/core/widgets/custom_network_image.dart';
import 'package:live_score_app/shard/widgets/match_result_state.dart';

class MatchResultRow extends StatelessWidget {
  const MatchResultRow({super.key, required this.match});
  final MatchEntity match;

  @override
  Widget build(BuildContext context) {
    final matchTimeFormat = DateTime.parse(match.date).toLocal();
    final matchTime = DateFormat('h:mm a').format(matchTimeFormat);

    return InkWell(
      splashColor: Colors.transparent,
      onTap: () =>
          GoRouter.of(context).push(AppRouters.matchPage, extra: match),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          children: [
            CustomNetworkImage(imageUrl: match.homeTeamImage, size: 18),
            SizedBox(width: 3),
            SizedBox(
              width: 90,
              child: Text(match.homeTeamName, style: AppStyles.body10(context)),
            ),
            Spacer(),
            MatchResultState(
              homeGoals: match.homeTeamGoals,
              awayGoals: match.awayTeamGoals,
              status: match.status,
              time: matchTime,
              radius: 26,
              minutes: match.minutes,
            ),
            Spacer(),
            SizedBox(
              width: 90,
              child: Text(
                textAlign: TextAlign.right,
                match.awayTeamName,
                style: AppStyles.body10(context),
              ),
            ),
            SizedBox(width: 3),
            CustomNetworkImage(imageUrl: match.awayTeamImage, size: 18),
          ],
        ),
      ),
    );
  }
}
