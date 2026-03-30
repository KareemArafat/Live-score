import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/fav%20teams/presentation/manager/manage_fav_teams_cubit/manage_fav_teams_cubit.dart';
import 'package:live_score_app/features/fav%20teams/presentation/manager/manage_fav_teams_cubit/manage_fav_teams_state.dart';
import 'package:live_score_app/features/fav%20teams/presentation/widgets/fav_team_card.dart';
import 'package:live_score_app/core/widgets/custom_loading_widget.dart';

class FavPageBody extends StatelessWidget {
  const FavPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ManageFavTeamsCubit, ManageFavTeamsState>(
            builder: (context, state) {
              if (state is GetFavTeamsSuccess) {
                final favTeams = state.teams;
                if (favTeams.isEmpty) {
                  return Center(
                    child: Text(
                      'No favorite teams added yet',
                      style: AppStyles.body14,
                    ),
                  );
                }
                return GridView.builder(
                  padding: EdgeInsets.only(top: 20, left: 12, right: 12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: favTeams.length,
                  itemBuilder: (context, index) =>
                      FavTeamCard(team: favTeams[index]),
                );
              } else {
                return CustomLoadingWidget();
              }
            },
          ),
        ),
      ],
    );
  }
}
