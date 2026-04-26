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
    return Column(
      children: [
        TabBar(
          dividerColor: Colors.transparent,
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          unselectedLabelStyle: AppStyles.body14(context),
          labelStyle: AppStyles.body14(context),
          tabAlignment: TabAlignment.center,
          padding: EdgeInsets.only(top: 20, bottom: 10),
          isScrollable: true,
          controller: tabController,
          tabs: [
            Padding(padding: const EdgeInsets.all(8.0), child: Text('Events')),
            if (match.matchHasLineups)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Lineup'),
              ),
            if (match.matchHasStats)
              Padding(padding: const EdgeInsets.all(8), child: Text('Stats')),
          ],
          indicator: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
