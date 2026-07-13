import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/utils/service_locator.dart';
import 'package:live_score_app/core/widgets/custom_app_bar.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_news_use_case.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_more_league_matches_use_case.dart';
import 'package:live_score_app/features/leagues/presentation/manager/league_news_cubit/league_news_cubit.dart';
import 'package:live_score_app/core/widgets/custom_scaffold.dart';
import 'package:live_score_app/shard/entities/league_entity.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_matches_use_case.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_table_use_case.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_players_stats_use_case.dart';
import 'package:live_score_app/features/leagues/presentation/manager/league_matches_cubit/league_matches_cubit.dart';
import 'package:live_score_app/features/leagues/presentation/manager/stats_avigation_cubit/stats_navigation_cubit.dart';
import 'package:live_score_app/features/leagues/presentation/manager/League_players_stats_cubit/league_players_stats_cubit.dart';
import 'package:live_score_app/features/leagues/presentation/manager/league_table_cubit/league_table_cubit.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/league_page_title.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/league_tap_bar.dart';
import 'package:provider/provider.dart';

class LeagueDetailsPage extends StatelessWidget {
  const LeagueDetailsPage({super.key, required this.leagueEntity});
  final LeagueEntity leagueEntity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StatsNavigationCubit()),
        BlocProvider(
          create: (context) => LeagueTableCubit(getIt<GetLeagueTableUseCase>()),
        ),
        BlocProvider(
          create: (context) => LeagueMatchesCubit(
            getIt<GetLeagueMatchesUseCase>(),
            getIt<GetMoreLeagueMatchesUseCase>(),
          ),
        ),

        BlocProvider(
          create: (context) =>
              LeaguePlayersStatsCubit(getIt<GetLeaguePlayersStatsUseCase>()),
        ),
        BlocProvider(
          create: (context) => LeagueNewsCubit(getIt<GetLeagueNewsUseCase>()),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (context) => LeagueEntityProvider(leagueEntity),
        child: CustomScaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(child: CustomAppBar()),
              SliverToBoxAdapter(child: LeaguePageTitle()),
            ],
            body: LeagueTapBar(),
          ),
        ),
      ),
    );
  }
}

class LeagueEntityProvider extends ChangeNotifier {
  LeagueEntity leagueEntity;
  List? seasons;

  LeagueEntityProvider(this.leagueEntity);

  void setSeasons(List seasonsList) {
    seasons = seasonsList;
    notifyListeners();
  }
}
