import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/leagues/domain/entities/league_entity.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_all_leagues_use_case.dart';

part 'all_leagues_state.dart';

class AllLeaguesCubit extends Cubit<AllLeaguesState> {
  AllLeaguesCubit(this.getLeaguesListUseCase) : super(AllLeaguesInitial());

  final GetAllLeaguesUseCase getLeaguesListUseCase;

  Future<void> getAllLeagues() async {
    emit(AllLeaguesLoading());
    var result = await getLeaguesListUseCase.execute();
    result.fold(
      (l) => emit(AllLeaguesFailure(errorMess: l.errMessage)),
      (r) => emit(AllLeaguesSuccess(leaguesList: r)),
    );
  }
}
