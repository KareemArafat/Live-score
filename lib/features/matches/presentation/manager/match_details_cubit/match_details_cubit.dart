import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/match_details_entity.dart';
import 'package:live_score_app/features/matches/domain/use_cases/get_match_details_use_case.dart';

part 'match_details_state.dart';

class MatchDetailsCubit extends Cubit<MatchDetailsState> {
  MatchDetailsCubit(this._getMatchDetailsUseCase)
    : super(MatchDetailsInitial());

  final GetMatchDetailsUseCase _getMatchDetailsUseCase;

  void getMatchDetails({required int matchId}) async {
    emit(MatchDetailsLoading());
    final result = await _getMatchDetailsUseCase.execute(matchId: matchId);
    if (isClosed) return;
    result.fold(
      (l) =>
          !isClosed ? emit(MatchDetailsFailure(errMess: l.errMessage)) : null,
      (r) => !isClosed ? emit(MatchDetailsSuccess(matchDetails: r)) : null,
    );
  }
}
