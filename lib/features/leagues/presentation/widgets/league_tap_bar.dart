import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/leagues/presentation/views/league_details_page.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/league_matches_view.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/league_news_view.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/league_stats_view.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/league_table_view.dart';
import 'package:live_score_app/shard/entities/league_entity.dart';
import 'package:provider/provider.dart';

class LeagueTapBar extends StatefulWidget {
  const LeagueTapBar({super.key});

  @override
  State<LeagueTapBar> createState() => _LeagueTapBarState();
}

class _LeagueTapBarState extends State<LeagueTapBar>
    with SingleTickerProviderStateMixin {
  late LeagueEntity leagueEntity;
  late TabController tabController;

  int tabsNum() {
    return leagueEntity.standings && leagueEntity.stats
        ? 4
        : leagueEntity.standings || leagueEntity.stats
        ? 3
        : 2;
  }

  @override
  void initState() {
    leagueEntity = context.read<LeagueEntityProvider>().leagueEntity;
    tabController = TabController(length: tabsNum(), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          dividerColor: Colors.transparent,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          unselectedLabelStyle: AppStyles.body14(context),
          labelStyle: AppStyles.body14(context),
          tabAlignment: TabAlignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          isScrollable: true,
          controller: tabController,
          tabs: [
            if (leagueEntity.standings)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text('Table'),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text('Matches'),
            ),
            if (leagueEntity.stats)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Text('Stats'),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text('News'),
            ),
          ],
          indicator: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              if (leagueEntity.standings) LeagueTableView(),
              LeagueMatchesView(),
              if (leagueEntity.stats) LeagueStatsView(),
              LeagueNewsView(),
            ],
          ),
        ),
      ],
    );
  }
}
