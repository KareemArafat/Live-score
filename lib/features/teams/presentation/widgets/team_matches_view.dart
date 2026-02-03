import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/widgets/custom_error_widget.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';
import 'package:live_score_app/shard/widgets/match_result_row.dart';
import 'package:live_score_app/features/teams/presentation/manager/team_matches_cubit/team_matches_cubit.dart';
import 'package:live_score_app/core/widgets/custom_snack_bar.dart';

class TeamMatchesView extends StatefulWidget {
  const TeamMatchesView({super.key, required this.teamId});
  final int teamId;

  @override
  State<TeamMatchesView> createState() => _TeamMatchesViewState();
}

class _TeamMatchesViewState extends State<TeamMatchesView>
    with AutomaticKeepAliveClientMixin {
  late TeamMatchesCubit cubit;
  late ScrollController scrollController;
  var matches = [];
  String? previousPageUrl;
  String? nextPageUrl;
  bool isNextLoading = false;
  bool isPreviousLoading = false;

  @override
  void initState() {
    scrollController = ScrollController(initialScrollOffset: 200)
      ..addListener(controllerListener);
    cubit = context.read<TeamMatchesCubit>()
      ..getTeamMatches(teamId: widget.teamId);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void controllerListener() async {
    var currentIndex = scrollController.position.pixels;
    var maxIndex = scrollController.position.maxScrollExtent;
    var minIndex = scrollController.position.minScrollExtent;

    if (currentIndex == minIndex &&
        previousPageUrl != null &&
        !isPreviousLoading) {
      isPreviousLoading = true;
      await cubit.getPreviousMatches(pageUrl: previousPageUrl!);
      isPreviousLoading = false;
    }
    if (maxIndex - currentIndex <= 200 &&
        nextPageUrl != null &&
        !isNextLoading) {
      isNextLoading = true;
      await cubit.getNextMatches(pageUrl: nextPageUrl!);
      isNextLoading = false;
    }
  }

  void saveScrollPosition() {
    final oldScrollHeight = scrollController.position.maxScrollExtent;
    final oldOffset = scrollController.offset;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final newScrollHeight = scrollController.position.maxScrollExtent;
      final scrollDiff = newScrollHeight - oldScrollHeight;
      scrollController.jumpTo(oldOffset + scrollDiff + 220);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<TeamMatchesCubit, TeamMatchesState>(
      listener: (context, state) {
        if (state is TeamMatchesSuccess) {
          matches = state.matches.gamesList ?? [];
          previousPageUrl = state.matches.previousPage;
          nextPageUrl = state.matches.nextPage;
        }
        if (state is PreviousMatchesSuccess) {
          if (state.matchesList.gamesList == null) {
            return previousPageUrl = null;
          }
          matches.insertAll(0, state.matchesList.gamesList!);
          previousPageUrl = state.matchesList.previousPage;
          saveScrollPosition();
        }
        if (state is NextMatchesSuccess) {
          if (state.matchesList.gamesList == null) {
            return nextPageUrl = null;
          }
          matches.addAll(state.matchesList.gamesList!);
          nextPageUrl = state.matchesList.nextPage;
        }
        if (state is PreviousMatchesFailure) {
          return customSnackBar(context, state.errorMess);
        }
        if (state is NextMatchesFailure) {
          return customSnackBar(context, state.errorMess);
        }
      },
      builder: (context, state) {
        if (state is TeamMatchesLoading) {
          return CustomLoadingWidget();
        } else if (state is TeamMatchesFailure) {
          return CustomErrorWidget(errorMess: state.errorMess);
        }
        return ListView.builder(
          controller: scrollController,
          padding: EdgeInsets.only(top: 12),
          itemCount: matches.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return isPreviousLoading
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const CustomLoadingWidget(size: -8),
                    )
                  : const SizedBox();
            }
            if (index == matches.length + 1) {
              return isNextLoading
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const CustomLoadingWidget(size: -8),
                    )
                  : const SizedBox(height: 10);
            }
            return MatchResultRow(match: matches[index - 1]);
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
