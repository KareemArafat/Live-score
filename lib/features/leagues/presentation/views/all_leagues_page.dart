import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/utils/service_locator.dart';
import 'package:live_score_app/core/widgets/custom_app_bar.dart';
import 'package:live_score_app/features/leagues/presentation/widgets/all_leagues_list.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_all_leagues_use_case.dart';
import 'package:live_score_app/features/leagues/presentation/manager/all_leagues_cubit/all_leagues_cubit.dart';

class AllLeaguesPage extends StatelessWidget {
  const AllLeaguesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AllLeaguesCubit(getIt<GetAllLeaguesUseCase>())..getAllLeagues(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CustomAppBar(isHome: true)),
          AllLeaguesList(),
        ],
      ),
    );
  }
}
