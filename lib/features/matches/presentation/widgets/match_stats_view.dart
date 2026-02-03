import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/matches/domain/entities/match_total_stats_entity/match_total_stats_entity.dart';
import 'package:live_score_app/features/matches/presentation/manager/match_stats_cubit/match_stats_cubit.dart';
import 'package:live_score_app/features/matches/presentation/widgets/possession_stat.dart';
import 'package:live_score_app/features/matches/presentation/widgets/total_stats_item.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:live_score_app/core/widgets/custom_error_widget.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';

class MatchStatsView extends StatefulWidget {
  const MatchStatsView({super.key});

  @override
  State<MatchStatsView> createState() => _MatchStatsViewState();
}

class _MatchStatsViewState extends State<MatchStatsView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    int matchId = context.read<MatchEntity>().matchId;
    BlocProvider.of<MatchStatsCubit>(context).getMatchStats(matchId: matchId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: BlocBuilder<MatchStatsCubit, MatchStatsState>(
        builder: (context, state) {
          if (state is MatchStatsSuccess) {
            final MatchTotalStatsEntity matchStats = state.matchStats;
            return ListView.builder(
              itemCount: matchStats.homeStats.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return PossessionStat(
                    homeTeamPossession: matchStats.homeStats[0].statValue,
                    awayTeamPossession: matchStats.awayStats[0].statValue,
                  );
                }
                return TotalStatsItem(
                  homeTeamStats: matchStats.homeStats[index],
                  awayTeamStats: matchStats.awayStats[index],
                );
              },
            );
          } else if (state is MatchStatsFailure) {
            return CustomErrorWidget(errorMess: state.errMess);
          } else {
            return CustomLoadingWidget();
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
