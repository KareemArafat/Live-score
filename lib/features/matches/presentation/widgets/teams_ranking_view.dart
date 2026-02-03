// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:live_score_app/core/theme/app_styles.dart';
// import 'package:live_score_app/features/matches_details/presentation/manager/match_teams_rank_cubit/match_teams_rank_cubit.dart';
// import 'package:live_score_app/del_match_entity.dart';
// import 'package:live_score_app/shard/widgets/custom_loading_widget.dart';

// class TeamsRankingView extends StatefulWidget {
//   const TeamsRankingView({super.key});

//   @override
//   State<TeamsRankingView> createState() => _TeamsRankingViewState();
// }

// class _TeamsRankingViewState extends State<TeamsRankingView>
//     with AutomaticKeepAliveClientMixin {
//   @override
//   void initState() {
//     BlocProvider.of<MatchTeamsRankCubit>(context).getMatchTeamsRank(
//       leagueId: getMatch().leagueId,
//       season: getMatch().leagueSeason,
//     );
//     super.initState();
//   }

//   DelMatchEntity getMatch() {
//     return context.read<DelMatchEntity>();
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return BlocBuilder<MatchTeamsRankCubit, MatchTeamsRankState>(
//       builder: (context, state) {
//         // if (state is MatchTeamsRankSuccess) {
//         //   List<TableEntity> tableList = [];
//         //   tableList.addAll(state.tableList);
//         //   return ListView.builder(
//         //     padding: EdgeInsets.all(0),
//         //     itemCount: tableList.length + 1,
//         //     itemBuilder: (context, index) {
//         //       if (index == 0) {
//         //         return TableDetailsBar();
//         //       }
//         //       final item = tableList[index - 1];
//         //       return TableItem(
//         //         teamRow: item,
//         //         isSelected:
//         //             item.teamId == getMatch().awayTeamId ||
//         //             item.teamId == getMatch().homeTeamId,
//         //         textColor: Colors.black,
//         //       );
//         //     },
//         //   );
//         // } else

//         if (state is MatchTeamsRankFailure) {
//           return Center(
//             child: Text(state.errMess, style: AppStyles.blockBody12),
//           );
//         } else {
//           return CustomLoadingWidget();
//         }
//       },
//     );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }
