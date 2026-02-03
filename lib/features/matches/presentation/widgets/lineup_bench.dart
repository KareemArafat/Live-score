import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/lineup_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/lineup_member_entity.dart';
import 'package:live_score_app/features/matches/presentation/widgets/lineup_player.dart';

class LineupBench extends StatelessWidget {
  const LineupBench({super.key, required this.lineup});
  final LineupEntity lineup;

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
                .map((player) => _subPlayer(player))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _subPlayer(LineupMemberEntity player) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 10),
      visualDensity: VisualDensity(vertical: -4),
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: LineupPlayer(player: player, isBench: true),
      ),
      title: Text(player.playerName, style: AppStyles.body12),
      subtitle: Text(player.positionName, style: AppStyles.grayBody10),
      trailing: Text(player.playerNum.toString(), style: AppStyles.body12),
    );
  }
}
