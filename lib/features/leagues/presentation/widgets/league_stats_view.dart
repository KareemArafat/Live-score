import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/leagues/presentation/manager/League_players_stats_cubit/league_players_stats_cubit.dart';
import 'package:live_score_app/features/leagues/presentation/views/league_details_page.dart';
import 'package:live_score_app/core/widgets/custom_gradient_border.dart';
import 'package:live_score_app/features/leagues/presentation/manager/stats_avigation_cubit/stats_navigation_cubit.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/stats_assists_view.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/stats_goals_view.dart';

class LeagueStatsView extends StatefulWidget {
  const LeagueStatsView({super.key});

  @override
  State<LeagueStatsView> createState() => _LeagueStatsViewState();
}

class _LeagueStatsViewState extends State<LeagueStatsView>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    final league = context.read<LeagueEntityProvider>().league;

    BlocProvider.of<LeaguePlayersStatsCubit>(
      context,
    ).getLeaguePlayersStats(leagueId: league.leagueId);
    _tabController = TabController(length: 2, vsync: this);
    super.initState();

    tabChange();
  }

  void tabChange() {
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        context.read<StatsNavigationCubit>().navigateTo(
          StatsTab.values[_tabController.index],
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<StatsNavigationCubit, StatsTab>(
      builder: (context, state) {
        final currentIndex = state == StatsTab.goals ? 0 : 1;

        if (_tabController.index != currentIndex) {
          _tabController.animateTo(currentIndex);
        }

        return NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: TabBar(
                controller: _tabController,
                onTap: (value) => context
                    .read<StatsNavigationCubit>()
                    .navigateTo(StatsTab.values[value]),
                dividerColor: Colors.transparent,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                indicator: const BoxDecoration(),
                tabs: [
                  tabButton("Goals", state == StatsTab.goals),
                  tabButton("Assists", state == StatsTab.assists),
                ],
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: const [StatsGoalsView(), StatsAssistsView()],
          ),
        );
      },
    );
  }

  Widget tabButton(String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: isSelected
          ? CustomGradientBorder(
              height: 40,
              width: 300,
              border: 8,
              linearGradient: AppColors.blueGradient,
              child: Center(child: Text(text, style: AppStyles.body14(context))),
            )
          : Text(text, style: AppStyles.body14(context)),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
