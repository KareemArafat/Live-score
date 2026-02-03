import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/shard/entities/news_entity.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_news_use_case.dart';

part 'league_news_state.dart';

class LeagueNewsCubit extends Cubit<LeagueNewsState> {
  LeagueNewsCubit(this._getLeagueNewsUseCase) : super(NewsInitial());

  final GetLeagueNewsUseCase _getLeagueNewsUseCase;

  Future<void> getLeagueNews({required int leagueId}) async {
    emit(NewsLoading());
    var result = await _getLeagueNewsUseCase.execute(leagueId: leagueId);
    result.fold(
      (l) => emit(NewsFailure(errMess: l.errMessage)),
      (r) => emit(NewsSuccess(newsList: r)),
    );
  }
}
