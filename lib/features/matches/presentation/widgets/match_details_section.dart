import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:live_score_app/core/responsive_helpers/size_helper_extensions.dart';
import 'package:live_score_app/core/theme/app_styles.dart';
import 'package:live_score_app/features/matches/presentation/widgets/match_details_section_state.dart';
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

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: Icon(Icons.arrow_back, size: context.sp(20)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.screenWidth / 3.5,
                child: Column(
                  children: [
                    CustomNetworkImage(
                      imageUrl: match.homeTeam.teamImage,
                      size: context.rMin(35),
                    ),
                    SizedBox(height: 5),
                    Text(
                      textAlign: TextAlign.center,
                      match.homeTeam.teamName,
                      style: AppStyles.body14(context),
                    ),
                  ],
                ),
              ),
              Spacer(),
              BlocBuilder<MatchDetailsCubit, MatchDetailsState>(
                builder: (context, state) {
                  if (state is MatchDetailsSuccess) {
                    return MatchDetailsSectionState(
                      matchEntity: state.matchDetails,
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.only(top: context.h(8)),
                    child: Text('-', style: AppStyles.body14(context)),
                  );
                },
              ),
              Spacer(),
              SizedBox(
                width: context.screenWidth / 3.5,
                child: Column(
                  children: [
                    CustomNetworkImage(
                      imageUrl: match.awayTeam.teamImage,
                      size: context.rMin(35),
                    ),
                    SizedBox(height: 5),
                    Text(
                      textAlign: TextAlign.center,
                      match.awayTeam.teamName,
                      style: AppStyles.body14(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        MatchTabBar(tabController: tabController),
      ],
    );
  }
}
