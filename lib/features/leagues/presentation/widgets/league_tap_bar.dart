import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/league_matches_view.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/league_news_view.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/league_stats_view.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/league_table_view.dart';

class LeagueTapBar extends StatefulWidget {
  const LeagueTapBar({super.key});

  @override
  State<LeagueTapBar> createState() => _LeagueTapBarState();
}

class _LeagueTapBarState extends State<LeagueTapBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
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
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          isScrollable: true,
          controller: _tabController,
          tabs: const [
            Padding(padding: EdgeInsets.all(8), child: Text('Table')),
            Padding(padding: EdgeInsets.all(8), child: Text('Matches')),
            Padding(padding: EdgeInsets.all(8), child: Text('Stats')),
            Padding(padding: EdgeInsets.all(8), child: Text('News')),
          ],
          indicator: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              LeagueTableView(),
              LeagueMatchesView(),
              LeagueStatsView(),
              LeagueNewsView(),
            ],
          ),
        ),
      ],
    );
  }
}
