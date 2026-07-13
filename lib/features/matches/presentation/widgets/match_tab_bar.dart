import 'package:flutter/material.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:provider/provider.dart';

class MatchTabBar extends StatelessWidget {
  const MatchTabBar({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final match = context.read<MatchEntity>();
    return TabBar(
      dividerColor: Colors.transparent,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      unselectedLabelStyle: AppStyles.grayBody12(context),
      labelStyle: AppStyles.body12(context),
      tabAlignment: TabAlignment.center,
      padding: EdgeInsets.only(top: 20, bottom: 10),
      isScrollable: true,
      controller: tabController,
      tabs: [
        Padding(padding: const EdgeInsets.all(8), child: Text(' Events ')),
        if (match.matchHasLineups)
          Padding(padding: const EdgeInsets.all(8), child: Text(' Lineup ')),
        if (match.matchHasStats)
          Padding(padding: const EdgeInsets.all(8), child: Text(' Stats ')),
      ],
      indicator: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white, width: 2),
      ),
    );
  }
}
