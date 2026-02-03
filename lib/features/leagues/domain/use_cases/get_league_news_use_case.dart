import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/shard/entities/news_entity.dart';
import 'package:live_score_app/features/leagues/domain/repos/leagues_repo.dart';

class GetLeagueNewsUseCase {
  final LeaguesRepo _leaguesRepo;

  GetLeagueNewsUseCase(this._leaguesRepo);

  Future<Either<Failure, List<NewsEntity>>> execute({
    required int leagueId,
  }) async {
    return await _leaguesRepo.getLeagueNews(leagueId: leagueId);
  }
}
