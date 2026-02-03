import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/teams/domain/use_cases/get_team_standing_use_case.dart';
import 'package:live_score_app/shard/entities/table_entity.dart';

part 'team_standing_state.dart';

class TeamStandingCubit extends Cubit<TeamStandingState> {
  TeamStandingCubit(this.getTeamStandingUseCase)
    : super(TeamTableRankInitial());

  final GetTeamStandingUseCase getTeamStandingUseCase;

  void getTeamStanding({required int teamId, int? leagueId}) async {
    emit(TeamTableRankLoading());
    final result = await getTeamStandingUseCase.execute(
      teamId: teamId,
      leagueId: leagueId,
    );
    result.fold(
      (l) => emit(TeamTableRankFailure(errorMess: l.errMessage)),
      (r) => emit(TeamTableRankSuccess(table: r)),
    );
  }
}
