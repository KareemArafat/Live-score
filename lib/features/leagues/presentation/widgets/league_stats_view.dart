import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/leagues/presentation/manager/League_players_stats_cubit/league_players_stats_cubit.dart';
import 'package:live_score_app/features/leagues/presentation/views/league_details_page.dart';
import 'package:live_score_app/core/widgets/custom_gradient_border.dart';
import 'package:live_score_app/features/leagues/presentation/manager/stats_avigation_cubit/stats_navigation_cubit.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/stats_assists_view.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/stats_goals_view.dart';
import 'package:live_score_app/shard/entities/league_entity.dart';

class LeagueStatsView extends StatefulWidget {
  const LeagueStatsView({super.key});

  @override
  State<LeagueStatsView> createState() => _LeagueStatsViewState();
}

class _LeagueStatsViewState extends State<LeagueStatsView>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late TabController tabController;
  late LeagueEntity leagueEntity;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        if (!tabController.indexIsChanging) {
          context.read<StatsNavigationCubit>().navigateTo(
            StatsTab.values[tabController.index],
          );
        }
      });
    leagueEntity = context.read<LeagueEntityProvider>().leagueEntity;
    context.read<LeaguePlayersStatsCubit>().getLeaguePlayersStats(
      leagueId: leagueEntity.leagueId,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<StatsNavigationCubit, StatsTab>(
      builder: (context, state) {
        final currentIndex = state.index;
        if (tabController.index != currentIndex) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => tabController.animateTo(currentIndex),
          );
        }

        return Column(
          children: [
            TabBar(
              controller: tabController,
              onTap: (value) => context.read<StatsNavigationCubit>().navigateTo(
                StatsTab.values[value],
              ),
              dividerColor: Colors.transparent,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              indicator: const BoxDecoration(),
              tabs: [
                tabButton("Goals", state == StatsTab.goals),
                tabButton("Assists", state == StatsTab.assists),
              ],
            ),
            SizedBox(height: context.h(6)),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  StatsGoalsView(leagueId: leagueEntity.leagueId),
                  StatsAssistsView(leagueId: leagueEntity.leagueId),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget tabButton(String text, bool isSelected) {
    return isSelected
        ? CustomGradientBorder(
            width: context.screenWidth / 3,
            border: 8,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.h(12),
                  horizontal: context.w(12),
                ),
                child: Text(text, style: AppStyles.body14(context)),
              ),
            ),
          )
        : Text(text, style: AppStyles.body14(context));
  }

  @override
  bool get wantKeepAlive => true;
}
