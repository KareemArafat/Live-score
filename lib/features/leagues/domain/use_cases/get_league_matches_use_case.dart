import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/shard/entities/league_matches_entity.dart';
import 'package:live_score_app/features/leagues/domain/repos/leagues_repo.dart';

class GetLeagueMatchesUseCase {
  final LeaguesRepo _leaguesRepo;
  GetLeagueMatchesUseCase(this._leaguesRepo);

  Future<Either<Failure, LeagueMatchesEntity>> execute({
    required int leagueId,
  }) async {
    return await _leaguesRepo.getLeagueMatches(leagueId: leagueId);
  }
}
