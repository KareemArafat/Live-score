import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/events_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/lineup_entity.dart';
import 'package:live_score_app/features/matches/presentation/widgets/lineup_bench.dart';
import 'package:live_score_app/features/matches/presentation/widgets/lineup_field.dart';
import 'package:live_score_app/shard/widgets/player_image.dart';

class LineupTabBarView extends StatelessWidget {
  const LineupTabBarView({
    super.key,
    required this.lineup,
    required this.events,
  });
  final LineupEntity lineup;
  final List<EventsEntity> events;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(12),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: AppColors.blueGradient,
                  ),
                  child: Text(lineup.lineupStatus, style: AppStyles.body12),
                ),
              ),
              LineupField(lineup: lineup, events: events),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: AppColors.blueGradient,
                ),
                child: Row(
                  children: [
                    Text('Formation', style: AppStyles.body12),
                    Spacer(),
                    Text(lineup.lineupFormation, style: AppStyles.body12),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: AppColors.blueGradient,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Coach', style: AppStyles.heading16),
                    ListTile(
                      contentPadding: EdgeInsets.only(top: 10),
                      visualDensity: VisualDensity(vertical: -4),
                      leading: PlayerImage(image: lineup.coach.playerImage),
                      title: Text(
                        lineup.coach.playerName,
                        style: AppStyles.body12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              LineupBench(lineup: lineup, events: events),
            ]),
          ),
        ),
      ],
    );
  }
}
