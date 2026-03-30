import 'package:flutter/material.dart';
import 'package:live_score_app/features/day%20matches/presentation/widgets/date_section.dart';
import 'package:live_score_app/features/day%20matches/presentation/widgets/day_matches_list.dart';

class MatchesPageBody extends StatelessWidget {
  const MatchesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateSection(),
        Expanded(child: MatchesDayList()),
      ],
    );
  }
}
