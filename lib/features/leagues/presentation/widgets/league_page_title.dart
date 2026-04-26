import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/features/leagues/presentation/views/league_details_page.dart';
import 'package:live_score_app/core/widgets/custom_network_image.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/league_season.dart';

class LeaguePageTitle extends StatelessWidget {
  const LeaguePageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final league = context.read<LeagueEntityProvider>().league;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Column(
        children: [
          Row(
            children: [
              CustomNetworkImage(imageUrl: league.leagueImage, size: 60),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    leagueNameSplit(league.leagueName),
                    style: AppStyles.heading18(context),
                  ),
                  Text(league.countryName!, style: AppStyles.grayBody12(context)),
                ],
              ),
              Spacer(),
              // FavIcon(
              //   team: TeamEntity(
              //     teamId: 0,
              //     teamLogo: 'teamLogo',
              //     teamName: 'teamName',
              //     countryId: 0,
              //     countryName: 'countryName',
              //     countryFlag: 'countryFlag',
              //     leagueId: 0,
              //   ),
              // ),
            ],
          ),
          Align(alignment: Alignment.centerRight, child: LeagueSeason()),
        ],
      ),
    );
  }
}
