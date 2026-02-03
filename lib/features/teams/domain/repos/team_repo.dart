import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/features/teams/domain/entities/squad_entity.dart';
import 'package:live_score_app/shard/entities/league_matches_entity.dart';
import 'package:live_score_app/shard/entities/table_entity.dart';
import 'package:live_score_app/shard/entities/news_entity.dart';

abstract class TeamRepo {
  Future<Either<Failure, SquadEntity>> getTeamSquad({required int teamId});

  Future<Either<Failure, LeagueMatchesEntity>> getTeamMatches({
    required int teamId,
  });

  Future<Either<Failure, LeagueMatchesEntity>> getMoreTeamMatches({
    required String pageUrl,
  });

  Future<Either<Failure, TableEntity>> getTeamStanding({
    required int teamId,
    required int? leagueId,
  });

  Future<Either<Failure, List<NewsEntity>>> getTeamNews({required int teamId});
}
