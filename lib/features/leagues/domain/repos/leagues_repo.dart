import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/shard/entities/league_entity.dart';
import 'package:live_score_app/shard/entities/league_matches_entity.dart';
import 'package:live_score_app/features/leagues/domain/entities/league_stats_entity.dart';
import 'package:live_score_app/shard/entities/news_entity.dart';
import 'package:live_score_app/shard/entities/table_entity.dart';

abstract class LeaguesRepo {
  Future<Either<Failure, List<LeagueEntity>>> getAllLeagues();

  Future<Either<Failure, TableEntity>> getLeagueTable({
    required int leagueId,
    int? season,
  });

  Future<Either<Failure, LeagueMatchesEntity>> getLeagueMatches({
    required int leagueId,
  });

  Future<Either<Failure, LeagueMatchesEntity>> getMoreLeagueMatches({
    required String pageUrl,
  });

  Future<Either<Failure, LeagueStatsEntity>> getLeaguePlayersStats({
    required int leagueId,
  });

  Future<Either<Failure, List<NewsEntity>>> getLeagueNews({
    required int leagueId,
  });
}
