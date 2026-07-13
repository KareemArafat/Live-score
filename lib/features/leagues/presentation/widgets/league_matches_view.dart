import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/widgets/custom_error_widget.dart';
import 'package:live_score_app/core/widgets/custom_gradient_widget.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';
import 'package:live_score_app/features/leagues/presentation/manager/league_matches_cubit/league_matches_cubit.dart';
import 'package:live_score_app/features/leagues/presentation/views/league_details_page.dart';
import 'package:live_score_app/shard/entities/league_entity.dart';
import 'package:live_score_app/shard/widgets/match_result_row.dart';

class LeagueMatchesView extends StatefulWidget {
  const LeagueMatchesView({super.key});

  @override
  State<LeagueMatchesView> createState() => _LeagueMatchesViewState();
}

class _LeagueMatchesViewState extends State<LeagueMatchesView>
    with AutomaticKeepAliveClientMixin {
  late LeagueMatchesCubit cubit;
  late LeagueEntity leagueEntity;

  @override
  void initState() {
    super.initState();
    leagueEntity = context.read<LeagueEntityProvider>().leagueEntity;
    cubit = context.read<LeagueMatchesCubit>()
      ..getLeagueMatches(leagueId: leagueEntity.leagueId);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomGradientWidget(
              child: IconButton(
                onPressed: () => cubit.getPreviousLeagueMatches(),
                icon: Icon(
                  Icons.arrow_circle_left_outlined,
                  size: context.rMin(30),
                ),
              ),
            ),
            CustomGradientWidget(
              child: IconButton(
                onPressed: () => cubit.getNextLeagueMatches(),
                icon: Icon(
                  Icons.arrow_circle_right_outlined,
                  size: context.rMin(30),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: context.h(6)),
        Expanded(
          child: BlocBuilder<LeagueMatchesCubit, LeagueMatchesState>(
            builder: (context, state) {
              if (state is MatchesSuccess) {
                return ListView.builder(
                  itemCount: state.leagueMatchesEntity.gamesList.length,
                  itemBuilder: (context, index) => MatchResultRow(
                    matchEntity: state.leagueMatchesEntity.gamesList[index],
                  ),
                );
              } else if (state is MatchesNotAvailable) {
                return Center(
                  child: Text(
                    'No Matches Available',
                    style: AppStyles.body14(context),
                  ),
                );
              } else if (state is MatchesFailure) {
                return CustomErrorWidget(
                  errorMess: state.errorMess,
                  onPressed: () =>
                      cubit.getLeagueMatches(leagueId: leagueEntity.leagueId),
                );
              } else if (state is PreviousMatchesFailure) {
                return CustomErrorWidget(
                  errorMess: state.errorMess,
                  onPressed: () => cubit.getPreviousLeagueMatches(),
                );
              } else if (state is NextMatchesFailure) {
                return CustomErrorWidget(
                  errorMess: state.errorMess,
                  onPressed: () => cubit.getNextLeagueMatches(),
                );
              }
              return const CustomLoadingWidget();
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
