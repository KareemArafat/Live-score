import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:live_score_app/shard/widgets/match_result_row.dart';
import 'package:live_score_app/features/leagues/presentation/views/league_details_page.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';
import 'package:live_score_app/features/leagues/presentation/manager/league_matches_cubit/league_matches_cubit.dart';

class LeagueMatchesView extends StatefulWidget {
  const LeagueMatchesView({super.key});

  @override
  State<LeagueMatchesView> createState() => _LeagueMatchesViewState();
}

class _LeagueMatchesViewState extends State<LeagueMatchesView>
    with AutomaticKeepAliveClientMixin {
  List<MatchEntity> matchesList = [];
  late LeagueMatchesCubit cubit;
  late ScrollController scrollController;
  String? previousPageUrl;
  String? nextPageUrl;
  bool isNextLoading = false;
  bool isPreviousLoading = false;

  @override
  void initState() {
    final league = context.read<LeagueEntityProvider>().league;
    cubit = BlocProvider.of<LeagueMatchesCubit>(context)
      ..getLeagueMatches(leagueId: league.leagueId);
    scrollController = ScrollController(initialScrollOffset: 100)
      ..addListener(controllerListener);
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
        !isPreviousLoading &&
        previousPageUrl != null) {
      isPreviousLoading = true;
      await cubit.getPreviousLeagueMatches(pageUrl: previousPageUrl!);
      isPreviousLoading = false;
    }
    if (currentIndex >= 0.9 * maxIndex &&
        nextPageUrl != null &&
        !isNextLoading) {
      isNextLoading = true;
      await cubit.getNextLeagueMatches(pageUrl: nextPageUrl!);
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
    return BlocConsumer<LeagueMatchesCubit, LeagueMatchesState>(
      listener: (context, state) async {
        if (state is MatchesSuccess) {
          matchesList = state.matchesList.gamesList!.reversed.toList();
          if (matchesList.isNotEmpty && matchesList.length < 30) {
            await cubit.getNextLeagueMatches(
              pageUrl: state.matchesList.nextPage!,
            );
          }
          previousPageUrl = state.matchesList.previousPage;
          nextPageUrl = state.matchesList.nextPage;
        } else if (state is PreviousMatchesSuccess) {
          if (state.matchesList.gamesList == null) {
            return previousPageUrl = null;
          }
          matchesList.insertAll(0, state.matchesList.gamesList!);
          previousPageUrl = state.matchesList.previousPage;
          saveScrollPosition();
        } else if (state is NextMatchesSuccess) {
          if (state.matchesList.gamesList == null) {
            return nextPageUrl = null;
          }
          matchesList.addAll(state.matchesList.gamesList!);
          nextPageUrl = state.matchesList.nextPage;
        }
      },
      builder: (context, state) {
        if (state is MatchesLoading) {
          return CustomLoadingWidget();
        } else if (state is MatchesFailure) {
          return Center(child: Text(state.errorMess));
        }
        return ListView.builder(
          controller: scrollController,
          itemCount: matchesList.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return isPreviousLoading
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const CustomLoadingWidget(size: -8),
                    )
                  : const SizedBox();
            }
            if (index == matchesList.length + 1) {
              return isNextLoading
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const CustomLoadingWidget(size: -8),
                    )
                  : const SizedBox(height: 10);
            }
            return MatchResultRow(match: matchesList[index - 1]);
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
