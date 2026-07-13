import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/features/day_matches/presentation/manager/day_matches_cubit/day_matches_cubit.dart';
import 'package:live_score_app/features/day_matches/presentation/widgets/fav_matches_list.dart';
import 'package:live_score_app/features/day_matches/presentation/widgets/league_day_matches_list.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:live_score_app/core/widgets/custom_error_widget.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';

class DayMatchesList extends StatefulWidget {
  const DayMatchesList({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<DayMatchesList> createState() => _DayMatchesListState();
}

class _DayMatchesListState extends State<DayMatchesList> {
  late DayMatchesCubit cubit;
  final String dayDate = DateFormat('dd/MM/y').format(DateTime.now());
  List<MatchEntity> allMatches = [];
  List<MatchEntity> favMatches = [];
  bool refresh = false;

  void startTimer() {
    Timer.periodic(Duration(minutes: 1), (_) {
      if (cubit.day == dayDate && refresh) {
        //  cubit.getDayMatches(isRefresh: true);
      }
    });
  }

  @override
  void initState() {
    cubit = BlocProvider.of<DayMatchesCubit>(context)..getDayMatches();
    cubit.day = dayDate;
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DayMatchesCubit, DayMatchesState>(
      listener: (context, state) {
        refresh = state is DayMatchesSuccess || state is RefreshLoading;
        if (state is DayMatchesSuccess) {
          allMatches = state.allMatches;
          favMatches = state.favMatches;
        }
      },
      builder: (context, state) {
        if (state is DayMatchesSuccess || state is RefreshLoading) {
          final leaguesMatches = groupMatchesByLeague(allMatches);
          return ListView.builder(
            controller: widget.controller,
            padding: EdgeInsets.only(top: 25),
            itemCount: favMatches.isNotEmpty
                ? leaguesMatches.length + 1
                : leaguesMatches.length,
            itemBuilder: (context, index) {
              if (favMatches.isNotEmpty && index == 0) {
                return FavMatchesList(favMatches: favMatches);
              }

              final leaguesMatchesList = favMatches.isNotEmpty
                  ? leaguesMatches[index - 1]
                  : leaguesMatches[index];

              return LeagueDayMatchesList(leagueMatches: leaguesMatchesList);
            },
          );
        } else if (state is DayMatchesFailure) {
          refresh = false;
          return CustomErrorWidget(
            errorMess: state.errMess,
            onPressed: () => cubit.getDayMatches(),
          );
        } else {
          refresh = false;
          return CustomLoadingWidget();
        }
      },
    );
  }
}
