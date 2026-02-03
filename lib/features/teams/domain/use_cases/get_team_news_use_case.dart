import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/features/teams/domain/repos/team_repo.dart';
import 'package:live_score_app/shard/entities/news_entity.dart';

class GetTeamNewsUseCase {
  final TeamRepo _teamRepo;

  GetTeamNewsUseCase(this._teamRepo);

  Future<Either<Failure, List<NewsEntity>>> execute({
    required int teamId,
  }) async {
    return await _teamRepo.getTeamNews(teamId: teamId);
  }
}
