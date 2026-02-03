import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/teams/domain/use_cases/get_team_news_use_case.dart';
import 'package:live_score_app/shard/entities/news_entity.dart';

part 'team_news_state.dart';

class TeamNewsCubit extends Cubit<TeamNewsState> {
  TeamNewsCubit(this.getTeamNewsUseCase) : super(TeamNewsInitial());

  final GetTeamNewsUseCase getTeamNewsUseCase;

  void getTeamNews({required int teamId}) async {
    emit(TeamNewsInitial());
    final result = await getTeamNewsUseCase.execute(teamId: teamId);

    result.fold(
      (l) => emit(TeamNewsFailure(errMess: l.errMessage)),
      (r) => emit(TeamNewsSuccess(news: r)),
    );
  }
}
