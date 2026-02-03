import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/utils/app_routers.dart';
import 'package:live_score_app/core/utils/cubit_observer.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/core/utils/service_locator.dart';
import 'package:live_score_app/features/fav_teams/domain/repos/fav_teams_repo.dart';
import 'package:live_score_app/features/fav_teams/presentation/manager/manage_fav_teams_cubit/manage_fav_teams_cubit.dart';

void main() async {
  Bloc.observer = CubitObserver();
  setupGetIt();
  await setUpHive();
  runApp(LiveScoreApp());
}

class LiveScoreApp extends StatelessWidget {
  const LiveScoreApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ManageFavTeamsCubit(getIt<FavTeamsRepo>()),
        ),
      ],

      child: MaterialApp.router(
        routerConfig: AppRouters.router,
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
