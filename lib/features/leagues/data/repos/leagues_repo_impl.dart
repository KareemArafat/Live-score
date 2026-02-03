import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/features/leagues/data/data_sources/leagues_remote_data_source.dart';
import 'package:live_score_app/features/leagues/domain/entities/league_entity.dart';
import 'package:live_score_app/shard/entities/league_matches_entity.dart';
import 'package:live_score_app/features/leagues/domain/entities/league_stats_entity.dart';
import 'package:live_score_app/shard/entities/news_entity.dart';
import 'package:live_score_app/shard/entities/table_entity.dart';
import 'package:live_score_app/features/leagues/domain/repos/leagues_repo.dart';

class LeaguesRepoImpl extends LeaguesRepo {
  final LeaguesRemoteDataSource _leaguesRemoteDataSource;
  LeaguesRepoImpl(this._leaguesRemoteDataSource);

  @override
  Future<Either<Failure, List<LeagueEntity>>> getAllLeagues() async {
    try {
      final List<LeagueEntity> leagues = await _leaguesRemoteDataSource
          .getAllLeagues();
      return right(leagues);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TableEntity>> getLeagueTable({
    required int leagueId,
    int? season,
  }) async {
    try {
      final table = await _leaguesRemoteDataSource.getLeagueTable(
        leagueId: leagueId,
        season: season,
      );
      return right(table);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LeagueMatchesEntity>> getLeagueMatches({
    required int leagueId,
  }) async {
    try {
      final matches = await _leaguesRemoteDataSource.getLeagueMatches(
        leagueId: leagueId,
      );
      return right(matches);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LeagueMatchesEntity>> getMoreLeagueMatches({
    required String pageUrl,
  }) async {
    try {
      final matches = await _leaguesRemoteDataSource.getMoreLeagueMatches(
        pageUrl: pageUrl,
      );
      return right(matches);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LeagueStatsEntity>> getLeaguePlayersStats({
    required int leagueId,
  }) async {
    try {
      final playersStatsModel = await _leaguesRemoteDataSource
          .getLeaguePlayersStats(leagueId: leagueId);
      final playersStatsEntity = playersStatsModel.toEntity();
      return right(playersStatsEntity);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> getLeagueNews({
    required int leagueId,
  }) async {
    try {
      final newsModel = await _leaguesRemoteDataSource.getLeagueNews(
        leagueId: leagueId,
      );
      final newsEntityList = newsModel.toEntityList();
      return right(newsEntityList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
