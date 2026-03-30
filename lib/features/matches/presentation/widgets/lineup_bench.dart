import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/events_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/lineup_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/lineup_member_entity.dart';
import 'package:live_score_app/features/matches/presentation/widgets/lineup_player.dart';

class LineupBench extends StatelessWidget {
  const LineupBench({super.key, required this.lineup, required this.events});
  final LineupEntity lineup;
  final List<EventsEntity> events;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: AppColors.blueGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Substitutions', style: AppStyles.heading16),
          SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: lineup.substitutions!
                .map((player) => _subPlayer(player, events))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _subPlayer(LineupMemberEntity player, List<EventsEntity> events) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 10),
      visualDensity: VisualDensity(vertical: -4),
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: LineupPlayer(player: player, events: events),
      ),
      title: Text(player.playerName, style: AppStyles.body12),
      subtitle: Text(player.positionName, style: AppStyles.grayBody10),
      trailing: Text(player.playerNum.toString(), style: AppStyles.body12),
    );
  }
}
