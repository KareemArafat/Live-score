import 'package:flutter/material.dart';
import 'package:live_score_app/features/matches/presentation/widgets/match_details_section.dart';
import 'package:live_score_app/features/matches/presentation/widgets/match_tab_bar_view.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:provider/provider.dart';

class MatchPageBody extends StatefulWidget {
  const MatchPageBody({super.key});

  @override
  State<MatchPageBody> createState() => _MatchPageBodyState();
}

class _MatchPageBodyState extends State<MatchPageBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late MatchEntity match;

  @override
  void initState() {
    match = context.read<MatchEntity>();
    tabController = TabController(length: matchTabsCount(), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  int matchTabsCount() {
    if (match.matchHasLineups && match.matchHasStats) return 3;
    if (match.matchHasLineups || match.matchHasStats) return 2;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MatchDetailsSection(tabController: tabController),
        MatchTabBarView(tabController: tabController),
      ],
    );
  }
}
