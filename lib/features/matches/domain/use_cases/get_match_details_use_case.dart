import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/match_details_entity.dart';
import 'package:live_score_app/features/matches/domain/repos/match_details_repo.dart';

class GetMatchDetailsUseCase {
  final MatchDetailsRepo _matchDetailsRepo;

  GetMatchDetailsUseCase(this._matchDetailsRepo);

  Future<Either<Failure, MatchDetailsEntity>> execute({
    required int matchId,
  }) async {
    return await _matchDetailsRepo.getMatchDetails(matchId: matchId);
  }
}
