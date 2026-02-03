import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/theme/app_colors.dart';
import 'package:live_score_app/features/fav_teams/presentation/manager/manage_fav_teams_cubit/manage_fav_teams_cubit.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';
import 'package:live_score_app/core/widgets/custom_gradient_widget.dart';

class FavIcon extends StatefulWidget {
  const FavIcon({super.key, required this.team});
  final TeamEntity team;

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  late ManageFavTeamsCubit favCubit;
  late bool isFav;

  @override
  void initState() {
    favCubit = BlocProvider.of<ManageFavTeamsCubit>(context);
    isFav = favCubit.checkFavTeam(teamId: widget.team.teamId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomGradientWidget(
      widget: IconButton(
        onPressed: () async {
          if (isFav) {
            await favCubit.removeFavTeam(team: widget.team);
          } else {
            await favCubit.addFavTeam(team: widget.team);
          }
          setState(() {
            isFav = !isFav;
          });
        },
        icon: Icon(isFav ? Icons.star_rounded : Icons.star_border_rounded),
        iconSize: 30,
      ),
      linearGradient: AppColors.blueGradient,
    );
  }
}
