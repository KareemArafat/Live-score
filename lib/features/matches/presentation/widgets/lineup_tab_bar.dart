import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/matches/presentation/manager/match_details_cubit/match_details_cubit.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:live_score_app/core/widgets/custom_error_widget.dart';
import 'package:live_score_app/core/widgets/custom_gradient_border.dart';
import 'package:live_score_app/features/matches/presentation/widgets/lineup_tab_bar_view.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';

class MatchLineupTabBar extends StatefulWidget {
  const MatchLineupTabBar({super.key});

  @override
  State<MatchLineupTabBar> createState() => _MatchLineupTabBarState();
}

class _MatchLineupTabBarState extends State<MatchLineupTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() => index = _tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverToBoxAdapter(
          child: TabBar(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            controller: _tabController,
            dividerColor: Colors.transparent,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            indicator: BoxDecoration(),
            tabs: [
              tabButton(context.read<MatchEntity>().homeTeamName, index == 0),
              tabButton(context.read<MatchEntity>().awayTeamName, index == 1),
            ],
          ),
        ),
      ],
      body: BlocBuilder<MatchDetailsCubit, MatchDetailsState>(
        builder: (context, state) {
          if (state is MatchDetailsSuccess) {
            return TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                LineupTabBarView(
                  lineup: state.matchDetails.homeLineUp!,
                  events: state.matchDetails.events,
                ),
                LineupTabBarView(
                  lineup: state.matchDetails.awayLineUp!,
                  events: state.matchDetails.events,
                ),
              ],
            );
          } else if (state is MatchDetailsFailure) {
            return CustomErrorWidget(errorMess: state.errMess);
          } else {
            return CustomLoadingWidget();
          }
        },
      ),
    );
  }

  Widget tabButton(String text, bool isSelected) {
    return isSelected
        ? CustomGradientBorder(
            widget: Center(child: Text(text, style: AppStyles.body10)),
            height: 40,
            width: 300,
            border: 8,
            linearGradient: AppColors.blueGradient,
          )
        : Text(text, style: AppStyles.body10);
  }
}
