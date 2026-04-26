import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/features/day%20matches/presentation/manager/day_matches_cubit/day_matches_cubit.dart';
import 'package:live_score_app/features/day%20matches/presentation/widgets/fav_matches_list.dart';
import 'package:live_score_app/features/day%20matches/presentation/widgets/league_day_matches_list.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:live_score_app/core/widgets/custom_error_widget.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';

class MatchesDayList extends StatefulWidget {
  const MatchesDayList({super.key});

  @override
  State<MatchesDayList> createState() => _MatchesDayListState();
}

class _MatchesDayListState extends State<MatchesDayList> {
  late DayMatchesCubit cubit;
  final String dayDate = DateFormat('dd/MM/y').format(DateTime.now());
  List<MatchEntity> allMatches = [];
  List<MatchEntity> favMatches = [];
  bool refresh = false;

  void startTimer() {
    Timer.periodic(Duration(minutes: 1), (timer) {
      if (cubit.day == dayDate && refresh) {
        cubit.getDayMatches(isRefresh: true);
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
    return BlocBuilder<DayMatchesCubit, DayMatchesState>(
      builder: (context, state) {
        if (state is DayMatchesSuccess || state is RefreshLoading) {
          refresh = true;
          if (state is DayMatchesSuccess) {
            allMatches = state.allMatches;
            favMatches = state.favMatches;
          }
          final leaguesMatches = groupMatchesByLeague(allMatches);
          return Stack(
            children: [
              ListView.builder(
                padding: EdgeInsets.only(top: 30),
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
                  return LeagueDayMatchesList(
                    leagueMatches: leaguesMatchesList,
                  );
                },
              ),
              if (state is RefreshLoading)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: CustomLoadingWidget(size: -8, withSecColor: true),
                  ),
                ),
            ],
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
