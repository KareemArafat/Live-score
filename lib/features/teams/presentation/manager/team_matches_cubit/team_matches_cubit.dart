import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/teams/domain/use_cases/get_more_team_matches_use_case.dart';
import 'package:live_score_app/features/teams/domain/use_cases/get_team_matches_use_case.dart';
import 'package:live_score_app/shard/entities/league_matches_entity.dart';

part 'team_matches_state.dart';

class TeamMatchesCubit extends Cubit<TeamMatchesState> {
  TeamMatchesCubit(this.getTeamMatchesUseCase, this.getMoreTeamMatchesUseCase)
    : super(TeamMatchesInitial());

  final GetTeamMatchesUseCase getTeamMatchesUseCase;
  final GetMoreTeamMatchesUseCase getMoreTeamMatchesUseCase;

  Future<void> getTeamMatches({required int teamId}) async {
    emit(TeamMatchesLoading());
    final result = await getTeamMatchesUseCase.execute(teamId: teamId);
    result.fold(
      (l) => emit(TeamMatchesFailure(errorMess: l.errMessage)),
      (r) => emit(TeamMatchesSuccess(matches: r)),
    );
  }

  Future<void> getPreviousMatches({required String pageUrl}) async {
    emit(PreviousMatchesLoading());
    final result = await getMoreTeamMatchesUseCase.execute(pageUrl: pageUrl);
    result.fold(
      (l) => emit(PreviousMatchesFailure(errorMess: l.errMessage)),
      (r) => emit(PreviousMatchesSuccess(matchesList: r)),
    );
  }

  Future<void> getNextMatches({required String pageUrl}) async {
    emit(NextMatchesLoading());
    final result = await getMoreTeamMatchesUseCase.execute(pageUrl: pageUrl);
    result.fold(
      (l) => emit(NextMatchesFailure(errorMess: l.errMessage)),
      (r) => emit(NextMatchesSuccess(matchesList: r)),
    );
  }
}
