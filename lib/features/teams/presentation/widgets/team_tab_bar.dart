import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/teams/presentation/widgets/team_news_view.dart';
import 'package:live_score_app/features/teams/presentation/widgets/team_standing_view.dart';
import 'package:live_score_app/features/teams/presentation/widgets/team_matches_view.dart';
import 'package:live_score_app/features/teams/presentation/widgets/team_squad_view.dart';

class TeamTabBar extends StatefulWidget {
  const TeamTabBar({super.key, required this.teamId, required this.leagueId});
  final int teamId;
  final int leagueId;

  @override
  State<TeamTabBar> createState() => _TeamTabBarState();
}

class _TeamTabBarState extends State<TeamTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
          unselectedLabelStyle: AppStyles.body14,
          labelStyle: AppStyles.body14,
          tabAlignment: TabAlignment.center,
          padding: EdgeInsets.only(top: 20, bottom: 10),
          isScrollable: true,
          controller: _tabController,
          tabs: [
            Padding(padding: const EdgeInsets.all(8.0), child: Text('Squad')),
            Padding(padding: const EdgeInsets.all(8), child: Text('Matches')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Standing'),
            ),
            Padding(padding: const EdgeInsets.all(8.0), child: Text('News')),
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
            children: [
              TeamSquadView(teamId: widget.teamId),
              TeamMatchesView(teamId: widget.teamId),
              TeamStandingView(teamId: widget.teamId),
              TeamNewsView(teamId: widget.teamId),
            ],
          ),
        ),
      ],
    );
  }
}
