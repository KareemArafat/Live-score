import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/features/leagues/domain/entities/league_stats_entity.dart';
import 'package:live_score_app/features/leagues/domain/repos/leagues_repo.dart';

class GetLeaguePlayersStatsUseCase {
  final LeaguesRepo _leaguesRepo;
  GetLeaguePlayersStatsUseCase(this._leaguesRepo);

  Future<Either<Failure, LeagueStatsEntity>> execute({
    required int leagueId,
  }) async {
    return await _leaguesRepo.getLeaguePlayersStats(leagueId: leagueId);
  }
}
