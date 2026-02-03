import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/shard/entities/league_matches_entity.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_matches_use_case.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_more_league_matches_use_case.dart';

part 'league_matches_state.dart';

class LeagueMatchesCubit extends Cubit<LeagueMatchesState> {
  LeagueMatchesCubit(
    this.getLeagueMatchesUseCase,
    this.getMoreLeagueMatchesUseCase,
  ) : super(MatchesInitial());

  final GetLeagueMatchesUseCase getLeagueMatchesUseCase;
  final GetMoreLeagueMatchesUseCase getMoreLeagueMatchesUseCase;

  Future<void> getLeagueMatches({required int leagueId}) async {
    emit(MatchesLoading());
    var result = await getLeagueMatchesUseCase.execute(leagueId: leagueId);
    result.fold(
      (l) => emit(MatchesFailure(errorMess: l.errMessage)),
      (r) => emit(MatchesSuccess(matchesList: r)),
    );
  }

  Future<void> getPreviousLeagueMatches({required String pageUrl}) async {
    emit(PreviousMatchesLoading());
    var result = await getMoreLeagueMatchesUseCase.execute(pageUrl: pageUrl);
    result.fold(
      (l) => emit(MatchesFailure(errorMess: l.errMessage)),
      (r) => emit(PreviousMatchesSuccess(matchesList: r)),
    );
  }

  Future<void> getNextLeagueMatches({required String pageUrl}) async {
    emit(NextMatchesLoading());
    var result = await getMoreLeagueMatchesUseCase.execute(pageUrl: pageUrl);
    result.fold(
      (l) => emit(MatchesFailure(errorMess: l.errMessage)),
      (r) => emit(NextMatchesSuccess(matchesList: r)),
    );
  }
}
