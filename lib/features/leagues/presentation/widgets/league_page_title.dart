import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/features/leagues/presentation/views/league_details_page.dart';
import 'package:live_score_app/core/widgets/custom_network_image.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/league_season.dart';

class LeaguePageTitle extends StatelessWidget {
  const LeaguePageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final leagueEntity = context.read<LeagueEntityProvider>().leagueEntity;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.h(24),
        horizontal: context.w(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomNetworkImage(
                imageUrl: leagueEntity.leagueImage,
                size: context.rMin(60),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    leagueNameSplit(leagueEntity.leagueName),
                    style: AppStyles.heading18(context),
                  ),
                  Text(
                    leagueEntity.isNational
                        ? 'International'
                        : leagueEntity.countryName,
                    style: AppStyles.grayBody12(context),
                  ),
                ],
              ),
            ],
          ),
          Align(alignment: Alignment.centerRight, child: LeagueSeason()),
        ],
      ),
    );
  }
}
