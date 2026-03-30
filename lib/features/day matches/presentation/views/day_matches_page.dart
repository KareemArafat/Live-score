import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/utils/service_locator.dart';
import 'package:live_score_app/features/day%20matches/domain/use_cases/get_all_matches_use_case.dart';
import 'package:live_score_app/features/day%20matches/domain/use_cases/get_fav_matches_use_case.dart';
import 'package:live_score_app/features/day%20matches/presentation/manager/day_matches_cubit/day_matches_cubit.dart';
import 'package:live_score_app/features/day%20matches/presentation/widgets/matches_page_body.dart';

class DayMatchesPage extends StatelessWidget {
  const DayMatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DayMatchesCubit(
        getIt<GetAllMatchesUseCase>(),
        getIt<GetFavMatchesUseCase>(),
      ),
      child: MatchesPageBody(),
    );
  }
}
