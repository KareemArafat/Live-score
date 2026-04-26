import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/core/utils/service_locator.dart';
import 'package:live_score_app/core/widgets/custom_scaffold.dart';
import 'package:live_score_app/features/matches/domain/use_cases/get_match_details_use_case.dart';
import 'package:live_score_app/features/matches/domain/use_cases/get_match_stats_use_case.dart';
import 'package:live_score_app/features/matches/presentation/manager/match_details_cubit/match_details_cubit.dart';
import 'package:live_score_app/features/matches/presentation/manager/match_stats_cubit/match_stats_cubit.dart';
import 'package:live_score_app/features/matches/presentation/widgets/match_page_body.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:provider/provider.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({super.key, required this.match});
  final MatchEntity match;

  @override
  Widget build(BuildContext context) {
    print(match.matchId);
    return CustomScaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                MatchDetailsCubit(getIt.get<GetMatchDetailsUseCase>())
                  ..getMatchDetails(matchId: match.matchId),
          ),
          BlocProvider(
            create: (context) =>
                MatchStatsCubit(getIt.get<GetMatchStatsUseCase>()),
          ),
        ],
        child: Provider.value(value: match, child: MatchPageBody()),
      ),
    );
  }
}
