import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/match_details_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_total_stats_entity/match_total_stats_entity.dart';

abstract class MatchDetailsRepo {
  Future<Either<Failure, MatchDetailsEntity>> getMatchDetails({
    required int matchId,
  });

  Future<Either<Failure, MatchTotalStatsEntity>> getMatchStats({
    required int matchId,
  });
}
