import 'package:flutter/material.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/events_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/lineup_entity.dart';
import 'package:live_score_app/features/matches/presentation/widgets/lineup_player.dart';

class LineupBench extends StatelessWidget {
  const LineupBench({super.key, required this.lineup, required this.events});
  final LineupEntity lineup;
  final List<EventEntity> events;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.w(12),
        vertical: context.h(12),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: AppColors.blueGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Substitutions', style: AppStyles.heading16(context)),
          SizedBox(height: context.h(10)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: lineup.substitutions!
                .map(
                  (player) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: context.h(6)),
                          child: LineupPlayer(player: player, events: events),
                        ),
                        SizedBox(width: context.w(12)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                player.playerName,
                                style: AppStyles.body12(context),
                              ),
                              Text(
                                player.positionName,
                                style: AppStyles.grayBody10(context),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          player.playerNum.toString(),
                          style: AppStyles.body12(context),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
