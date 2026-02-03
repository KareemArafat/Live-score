import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/shard/entities/league_matches_entity.dart';
import 'package:live_score_app/features/leagues/domain/repos/leagues_repo.dart';

class GetMoreLeagueMatchesUseCase {
  final LeaguesRepo _leaguesRepo;

  GetMoreLeagueMatchesUseCase(this._leaguesRepo);

  Future<Either<Failure, LeagueMatchesEntity>> execute({
    required String pageUrl,
  }) async {
    return await _leaguesRepo.getMoreLeagueMatches(pageUrl: pageUrl);
  }
}
