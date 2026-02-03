import 'package:flutter/material.dart';
import 'package:live_score_app/features/matches/presentation/widgets/events_view.dart';
import 'package:live_score_app/features/matches/presentation/widgets/lineup_tab_bar.dart';
import 'package:live_score_app/features/matches/presentation/widgets/match_stats_view.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:provider/provider.dart';

class MatchTabBarView extends StatelessWidget {
  const MatchTabBarView({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final match = context.read<MatchEntity>();
    return Expanded(
      child: Container(
        color: Colors.white.withAlpha(15),
        child: TabBarView(
          controller: tabController,
          children: [
            EventsView(),
            if (match.matchHasLineups) MatchLineupTabBar(),
            if (match.matchHasStats) MatchStatsView(),
          ],
        ),
      ),
    );
  }
}
