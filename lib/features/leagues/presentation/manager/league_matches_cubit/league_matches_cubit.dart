import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/shard/entities/league_matches_entity.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_matches_use_case.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_more_league_matches_use_case.dart';

part 'league_matches_state.dart';

class LeagueMatchesCubit extends Cubit<LeagueMatchesState> {
  LeagueMatchesCubit(
    this._getLeagueMatchesUseCase,
    this._getMoreLeagueMatchesUseCase,
  ) : super(MatchesInitial());

  final GetLeagueMatchesUseCase _getLeagueMatchesUseCase;
  final GetMoreLeagueMatchesUseCase _getMoreLeagueMatchesUseCase;
  final List<LeagueMatchesEntity> pages = [];
  int index = 0;
  bool endNext = false;
  bool endPrevious = false;

  Future<void> getLeagueMatches({required int leagueId}) async {
    emit(MatchesLoading());
    final result = await _getLeagueMatchesUseCase.execute(leagueId: leagueId);
    result.fold((l) => emit(MatchesFailure(errorMess: l.errMessage)), (r) {
      pages.clear();
      endNext = endPrevious = false;
      index = 0;
      pages.add(r);
      if (r.gamesList.isEmpty) return emit(MatchesNotAvailable());
      emit(MatchesSuccess(leagueMatchesEntity: r));
    });
  }

  Future<void> getPreviousLeagueMatches() async {
    endNext = false;
    if (state is NextMatchesFailure || state is NextMatchesLoading) {
      return emit(MatchesSuccess(leagueMatchesEntity: pages[index]));
    }
    if (pages.isEmpty ||
        pages[index].gamesList.isEmpty ||
        endPrevious ||
        state is PreviousMatchesLoading ||
        state is PreviousMatchesFailure) {
      return;
    }
    emit(PreviousMatchesLoading());
    if (index > 0) {
      return emit(MatchesSuccess(leagueMatchesEntity: pages[--index]));
    }
    final result = await _getMoreLeagueMatchesUseCase.execute(
      pageUrl: pages[index].previousPage!,
    );
    result.fold((l) => emit(PreviousMatchesFailure(errorMess: l.errMessage)), (
      r,
    ) {
      if (r.previousPage == null) {
        endPrevious = true;
        return emit(MatchesSuccess(leagueMatchesEntity: pages[index]));
      }
      pages.insert(0, r);
      index = 0;
      emit(MatchesSuccess(leagueMatchesEntity: r));
    });
  }

  Future<void> getNextLeagueMatches() async {
    endPrevious = false;
    if (state is PreviousMatchesFailure || state is PreviousMatchesLoading) {
      return emit(MatchesSuccess(leagueMatchesEntity: pages[index]));
    }
    if (pages.isEmpty ||
        pages[index].gamesList.isEmpty ||
        endNext ||
        state is NextMatchesLoading ||
        state is NextMatchesFailure) {
      return;
    }
    emit(NextMatchesLoading());
    if (index + 1 < pages.length) {
      return emit(MatchesSuccess(leagueMatchesEntity: pages[++index]));
    }
    final result = await _getMoreLeagueMatchesUseCase.execute(
      pageUrl: pages[index].nextPage!,
    );
    result.fold((l) => emit(NextMatchesFailure(errorMess: l.errMessage)), (r) {
      if (r.nextPage == null) {
        endNext = true;
        return emit(MatchesSuccess(leagueMatchesEntity: pages[index]));
      }
      pages.add(r);
      index++;
      emit(MatchesSuccess(leagueMatchesEntity: r));
    });
  }
}
