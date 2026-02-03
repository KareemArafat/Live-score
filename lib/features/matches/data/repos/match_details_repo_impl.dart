import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/features/matches/data/data_source/match_details_remote_data_source.dart';
import 'package:live_score_app/features/matches/domain/entities/match_details_entity/match_details_entity.dart';
import 'package:live_score_app/features/matches/domain/entities/match_total_stats_entity/match_total_stats_entity.dart';
import 'package:live_score_app/features/matches/domain/repos/match_details_repo.dart';

class MatchDetailsRepoImpl extends MatchDetailsRepo {
  final MatchDetailsRemoteDataSource _matchDetailsRemoteDataSource;
  MatchDetailsRepoImpl(this._matchDetailsRemoteDataSource);

  @override
  Future<Either<Failure, MatchDetailsEntity>> getMatchDetails({
    required int matchId,
  }) async {
    try {
      final matchDetails = await _matchDetailsRemoteDataSource.getMatchDetails(
        matchId: matchId,
      );
      return right(matchDetails.toEntity());
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDio(e));
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MatchTotalStatsEntity>> getMatchStats({
    required int matchId,
  }) async {
    try {
      final matchStats = await _matchDetailsRemoteDataSource.getMatchStats(
        matchId: matchId,
      );
      return right(matchStats.toEntity());
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDio(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
