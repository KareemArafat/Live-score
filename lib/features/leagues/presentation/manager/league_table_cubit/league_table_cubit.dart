import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/shard/entities/table_entity.dart';
import 'package:live_score_app/features/leagues/domain/use_cases/get_league_table_use_case.dart';

part 'league_table_state.dart';

class LeagueTableCubit extends Cubit<LeagueTableState> {
  LeagueTableCubit(this.getLeagueTableUseCase) : super(TableInitial());

  final GetLeagueTableUseCase getLeagueTableUseCase;

  void getLeagueTable({required int leagueId, required int? season}) async {
    emit(TableLoading());

    var result = await getLeagueTableUseCase.execute(
      leagueId: leagueId,
      season: season,
    );

    result.fold(
      (l) => emit(TableFailure(errorMess: l.errMessage)),
      (r) => emit(TableSuccess(table: r)),
    );
  }
}
