import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';
import 'package:live_score_app/features/teams/presentation/manager/team_standing_cubit/team_standing_cubit.dart';
import 'package:live_score_app/shard/widgets/table_details_bar.dart';
import 'package:live_score_app/shard/widgets/table_item.dart';

class TeamStandingView extends StatefulWidget {
  const TeamStandingView({super.key, this.leagueId, required this.teamId});
  final int? leagueId;
  final int teamId;

  @override
  State<TeamStandingView> createState() => _TeamStandingViewState();
}

class _TeamStandingViewState extends State<TeamStandingView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    context.read<TeamStandingCubit>().getTeamStanding(teamId: widget.teamId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<TeamStandingCubit, TeamStandingState>(
      builder: (context, state) {
        if (state is TeamTableRankSuccess) {
          final tableRows = state.table.rows;
          return ListView.builder(
            padding: EdgeInsets.only(top: 12),
            itemCount: tableRows.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return TableDetailsBar();
              }
              if (widget.teamId == tableRows[index - 1].team?.teamId) {
                return TableItem(
                  teamRow: tableRows[index - 1],
                  isSelected: true,
                );
              } else {
                return TableItem(teamRow: tableRows[index - 1]);
              }
            },
          );
        } else if (state is TeamTableRankFailure) {
          return Center(child: Text(state.errorMess));
        } else {
          return CustomLoadingWidget();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
