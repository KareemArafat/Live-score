import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/utils/app_routers.dart';
import 'package:live_score_app/core/utils/cubit_observer.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/core/utils/service_locator.dart';
import 'package:live_score_app/core/utils/shard_pref.dart';
import 'package:live_score_app/features/fav%20teams/domain/repos/fav_teams_repo.dart';
import 'package:live_score_app/features/fav%20teams/presentation/manager/manage_fav_teams_cubit/manage_fav_teams_cubit.dart';
import 'package:live_score_app/features/search/domain/use_cases/search_use_case.dart';
import 'package:live_score_app/features/search/presentation/manager/search%20result%20cubit/search_result_cubit.dart';

void main() async {
  Bloc.observer = CubitObserver();
  setupGetIt();
  await setUpHive();
  final isSeen = await ShardPref.getOnBoarding();
  runApp(LiveScoreApp(isSeen: isSeen));
}

class LiveScoreApp extends StatelessWidget {
  const LiveScoreApp({super.key, required this.isSeen});
  final bool isSeen;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ManageFavTeamsCubit(getIt<FavTeamsRepo>()),
        ),
        BlocProvider(
          create: (context) => SearchResultCubit(getIt<SearchUseCase>()),
        ),
      ],

      child: MaterialApp.router(
        routerConfig: AppRouters.router(isSeen),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Poppins',
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
    );
  }
}
