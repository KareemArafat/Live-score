import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/widgets/custom_error_widget.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';
import 'package:live_score_app/shard/entities/league_entity.dart';
import 'package:live_score_app/features/leagues/presentation/manager/all_leagues_cubit/all_leagues_cubit.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/all_leagues_list_item.dart';

class AllLeaguesList extends StatelessWidget {
  const AllLeaguesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllLeaguesCubit, AllLeaguesState>(
      builder: (context, state) {
        if (state is AllLeaguesSuccess) {
          final List<LeagueEntity> leaguesList = state.leaguesList;
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: leaguesList.length,
              (context, index) =>
                  AllLeaguesListItem(leagueEntity: leaguesList[index]),
            ),
          );
        }
        if (state is AllLeaguesFailure) {
          return SliverFillRemaining(
            child: CustomErrorWidget(
              errorMess: state.errorMess,
              onPressed: () => context.read<AllLeaguesCubit>().getAllLeagues(),
            ),
          );
        } else {
          return SliverFillRemaining(child: CustomLoadingWidget());
        }
      },
    );
  }
}
