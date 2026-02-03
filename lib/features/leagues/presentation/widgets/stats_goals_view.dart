import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/leagues/presentation/manager/League_players_stats_cubit/league_players_stats_cubit.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/stats_goals_details_bar.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/stats_goal_item.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';

class StatsGoalsView extends StatelessWidget {
  const StatsGoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaguePlayersStatsCubit, LeaguePlayersStatsState>(
      builder: (context, state) {
        if (state is StatsSuccess) {
          final topScoresList = state.playersStats.goals;
          return ListView.builder(
            padding: EdgeInsets.only(left: 12, right: 12, top: 12),
            itemCount: topScoresList.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return StatsGoalsDetailsBar();
              }
              return StatsGoalItem(
                player: topScoresList[index - 1],
                rank: index,
              );
            },
          );
        } else if (state is StatsFailure) {
          return Center(child: Text(state.errorMess));
        } else {
          return CustomLoadingWidget();
        }
      },
    );
  }
}
