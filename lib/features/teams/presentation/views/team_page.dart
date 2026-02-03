import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/utils/service_locator.dart';
import 'package:live_score_app/features/teams/domain/use_cases/get_more_team_matches_use_case.dart';
import 'package:live_score_app/features/teams/domain/use_cases/get_team_news_use_case.dart';
import 'package:live_score_app/features/teams/presentation/manager/team_news_cubit/team_news_cubit.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';
import 'package:live_score_app/core/widgets/custom_app_bar.dart';
import 'package:live_score_app/core/widgets/custom_scaffold.dart';
import 'package:live_score_app/features/teams/domain/use_cases/get_team_matches_use_case.dart';
import 'package:live_score_app/features/teams/domain/use_cases/get_team_squad_use_case.dart';
import 'package:live_score_app/features/teams/domain/use_cases/get_team_standing_use_case.dart';
import 'package:live_score_app/features/teams/presentation/manager/team_matches_cubit/team_matches_cubit.dart';
import 'package:live_score_app/features/teams/presentation/manager/team_squad_cubit/team_squad_cubit.dart';
import 'package:live_score_app/features/teams/presentation/manager/team_standing_cubit/team_standing_cubit.dart';
import 'package:live_score_app/features/teams/presentation/widgets/team_page_title.dart';
import 'package:live_score_app/features/teams/presentation/widgets/team_tab_bar.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key, required this.team});
  final TeamEntity team;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TeamSquadCubit(getIt.get<GetTeamSquadUseCase>()),
        ),
        BlocProvider(
          create: (context) => TeamMatchesCubit(
            getIt.get<GetTeamMatchesUseCase>(),
            getIt.get<GetMoreTeamMatchesUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) =>
              TeamStandingCubit(getIt.get<GetTeamStandingUseCase>()),
        ),
        BlocProvider(
          create: (context) => TeamNewsCubit(getIt.get<GetTeamNewsUseCase>()),
        ),
      ],
      child: CustomScaffold(
        body: Column(
          children: [
            CustomAppBar(),
            TeamPageTitle(team: team),
            Expanded(
              child: TeamTabBar(teamId: team.teamId, leagueId: team.leagueId),
            ),
          ],
        ),
      ),
    );
  }
}
