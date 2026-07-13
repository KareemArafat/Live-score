import 'package:flutter/cupertino.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_images.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/events_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/lineup_entity.dart';
import 'package:live_score_app/features/matches/presentation/widgets/lineup_player.dart';

class LineupField extends StatelessWidget {
  const LineupField({super.key, required this.lineup, required this.events});
  final LineupEntity lineup;
  final List<EventEntity> events;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.isLandscape ? context.w(250) : context.h(500),
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.only(
        left: context.w(8),
        right: context.w(8),
        bottom: context.h(24),
        top: context.h(40),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(AppImages.lineupField),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (lineup.line5.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: lineup.line5
                  .map((player) => LineupPlayer(player: player, events: events))
                  .toList(),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: lineup.line4
                .map((player) => LineupPlayer(player: player, events: events))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: lineup.line3
                .map((player) => LineupPlayer(player: player, events: events))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: lineup.line2
                .map((player) => LineupPlayer(player: player, events: events))
                .toList(),
          ),
          LineupPlayer(player: lineup.goalKeeper, events: events),
        ],
      ),
    );
  }
}
