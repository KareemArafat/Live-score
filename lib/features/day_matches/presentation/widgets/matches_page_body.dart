import 'package:flutter/material.dart';
import 'package:live_score_app/shard/widgets/home_app_bar.dart';
import 'package:live_score_app/features/day_matches/presentation/widgets/date_section.dart';
import 'package:live_score_app/features/day_matches/presentation/widgets/day_matches_list.dart';

class MatchesPageBody extends StatelessWidget {
  const MatchesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBar(),
        SizedBox(height: 10),
        DateSection(),
        Expanded(child: MatchesDayList()),
      ],
    );
  }
}
