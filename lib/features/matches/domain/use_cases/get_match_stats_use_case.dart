import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/features/matches/domain/entities/match_total_stats_entity/match_total_stats_entity.dart';
import 'package:live_score_app/features/matches/domain/repos/match_details_repo.dart';

class GetMatchStatsUseCase {
  final MatchDetailsRepo _matchDetailsRepo;

  GetMatchStatsUseCase(this._matchDetailsRepo);

  Future<Either<Failure, MatchTotalStatsEntity>> execute({
    required int matchId,
  }) async {
    return await _matchDetailsRepo.getMatchStats(matchId: matchId);
  }
}
