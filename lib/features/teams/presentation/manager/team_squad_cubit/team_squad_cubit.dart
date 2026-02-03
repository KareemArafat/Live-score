import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/teams/domain/entities/squad_entity.dart';
import 'package:live_score_app/features/teams/domain/use_cases/get_team_squad_use_case.dart';
part 'team_squad_state.dart';

class TeamSquadCubit extends Cubit<TeamSquadState> {
  TeamSquadCubit(this.getTeamSquadUseCase) : super(TeamSquadInitial());

  final GetTeamSquadUseCase getTeamSquadUseCase;

  void getTeamSquad({required int teamId}) async {
    emit(TeamSquadLoading());
    var result = await getTeamSquadUseCase.execute(teamId: teamId);

    result.fold(
      (l) => emit(TeamSquadFailure(errorMess: l.errMessage)),
      (r) => emit(TeamSquadSuccess(squad: r)),
    );
  }
}
