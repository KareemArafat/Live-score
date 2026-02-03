import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/features/teams/data/data_sources/team_remote_data_source.dart';
import 'package:live_score_app/features/teams/domain/entities/squad_entity.dart';
import 'package:live_score_app/features/teams/domain/repos/team_repo.dart';
import 'package:live_score_app/shard/entities/league_matches_entity.dart';
import 'package:live_score_app/shard/entities/table_entity.dart';
import 'package:live_score_app/shard/entities/news_entity.dart';

class TeamRepoImpl extends TeamRepo {
  final TeamRemoteDataSource _teamRemoteDataSource;
  TeamRepoImpl(this._teamRemoteDataSource);

  @override
  Future<Either<Failure, SquadEntity>> getTeamSquad({
    required int teamId,
  }) async {
    try {
      final squadModel = await _teamRemoteDataSource.getSquadPlayers(
        teamId: teamId,
      );
      return right(squadModel.toEntity());
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDio(e));

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LeagueMatchesEntity>> getTeamMatches({
    required int teamId,
  }) async {
    try {
      final matchesModel = await _teamRemoteDataSource.getTeamMatches(
        teamId: teamId,
      );
      return right(matchesModel);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDio(e));

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LeagueMatchesEntity>> getMoreTeamMatches({
    required String pageUrl,
  }) async {
    try {
      final matchesModel = await _teamRemoteDataSource.getMoreTeamMatches(
        pageUrl: pageUrl,
      );
      return right(matchesModel);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDio(e));

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TableEntity>> getTeamStanding({
    required int teamId,
    required int? leagueId,
  }) async {
    try {
      final tableModel = await _teamRemoteDataSource.getTeamStanding(
        teamId: teamId,
        leagueId: leagueId,
      );
      return right(tableModel);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDio(e));

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> getTeamNews({
    required int teamId,
  }) async {
    try {
      final newsModel = await _teamRemoteDataSource.getTeamNews(teamId: teamId);

      return right(newsModel.toEntityList());
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDio(e));

      return left(ServerFailure(e.toString()));
    }
  }
}
