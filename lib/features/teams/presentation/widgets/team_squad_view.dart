import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/teams/domain/entities/squad_entity.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';
import 'package:live_score_app/features/teams/presentation/manager/team_squad_cubit/team_squad_cubit.dart';
import 'package:live_score_app/features/teams/presentation/widgets/squad_position_section.dart';

class TeamSquadView extends StatefulWidget {
  const TeamSquadView({super.key, required this.teamId});
  final int teamId;

  @override
  State<TeamSquadView> createState() => _TeamSquadViewState();
}

class _TeamSquadViewState extends State<TeamSquadView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    context.read<TeamSquadCubit>().getTeamSquad(teamId: widget.teamId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<TeamSquadCubit, TeamSquadState>(
      builder: (context, state) {
        if (state is TeamSquadSuccess) {
          SquadEntity squad = state.squad;
          return ListView(
            padding: EdgeInsets.only(left: 12, right: 12, top: 12),
            children: [
              SquadPositionSection(sectionName: 'Coach', coach: squad.coach),
              SquadPositionSection(
                sectionName: 'Goalkeepers',
                players: squad.goalkeepers,
              ),
              SquadPositionSection(
                sectionName: 'Defenders',
                players: squad.defenders,
              ),
              SquadPositionSection(
                sectionName: 'Midfielders',
                players: squad.midfielders,
              ),
              SquadPositionSection(
                sectionName: 'Attackers',
                players: squad.attackers,
              ),
            ],
          );
        } else if (state is TeamSquadFailure) {
          return Center(child: Text(state.errorMess));
        } else {
          return const Center(child: CustomLoadingWidget());
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
