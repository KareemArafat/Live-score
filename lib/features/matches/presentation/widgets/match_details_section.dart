import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:live_score_app/core/theme/app_images.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/shard/widgets/match_result_state.dart';
import 'package:live_score_app/features/matches/presentation/manager/match_details_cubit/match_details_cubit.dart';
import 'package:live_score_app/features/matches/presentation/widgets/match_tab_bar.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:live_score_app/core/widgets/custom_network_image.dart';

class MatchDetailsSection extends StatelessWidget {
  const MatchDetailsSection({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final match = context.read<MatchEntity>();
    final dateFormat = DateTime.parse(match.date);
    final matchTime = DateFormat('h:m a').format(dateFormat);

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3.8,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.matchBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: Icon(Icons.arrow_back),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  child: Column(
                    children: [
                      CustomNetworkImage(
                        imageUrl: match.homeTeamImage,
                        size: 35,
                      ),
                      SizedBox(height: 5),
                      Text(
                        textAlign: TextAlign.center,
                        match.homeTeamName,
                        style: AppStyles.body14,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: BlocBuilder<MatchDetailsCubit, MatchDetailsState>(
                    builder: (context, state) {
                      if (state is MatchDetailsSuccess) {
                        final matchDetails = state.matchDetails;
                        return MatchResultState(
                          radius: 25,
                          status: matchDetails.matchStatus,
                          homeGoals: matchDetails.homeTeamGoals,
                          awayGoals: matchDetails.awayTeamGoals,
                          time: matchTime,
                          minutes: matchDetails.minutes,
                        );
                      }
                      return Text('-');
                    },
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 120,
                  child: Column(
                    children: [
                      CustomNetworkImage(
                        imageUrl: match.awayTeamImage,
                        size: 35,
                      ),
                      SizedBox(height: 5),
                      Text(
                        textAlign: TextAlign.center,
                        match.awayTeamName,
                        style: AppStyles.body14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          MatchTabBar(tabController: tabController),
        ],
      ),
    );
  }
}
