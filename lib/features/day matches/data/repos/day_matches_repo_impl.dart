import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/core/utils/app_const.dart';
import 'package:live_score_app/features/day%20matches/data/data_source/day_matches_remote_data_source.dart';
import 'package:live_score_app/features/day%20matches/domain/repos/day_matches_repo.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';

class DayMatchesRepoImpl extends DayMatchesRepo {
  final DayMatchesRemoteDataSource dayMatchesRemoteDataSource;

  DayMatchesRepoImpl(this.dayMatchesRemoteDataSource);

  @override
  @override
  Future<Either<Failure, List<MatchEntity>>> getAllMatches({
    String? day,
  }) async {
    try {
      final matches = await dayMatchesRemoteDataSource.getDayMatches(day: day);
      return right(matches);
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.cancel) {
          return left(ServerFailure('cancelled'));
        }
        return left(ServerFailure.fromDio(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  List<MatchEntity> getFavMatches({required List<MatchEntity> allMatches}) {
    List<TeamEntity> favTeams = Hive.box<TeamEntity>(
      AppConst.kFavTeam,
    ).values.toList();
    List<MatchEntity> favMatches = [];

    for (var match in allMatches) {
      for (var team in favTeams) {
        if (match.homeTeamId == team.teamId ||
            match.awayTeamId == team.teamId) {
          favMatches.add(match);
          break;
        }
      }
    }

    return favMatches;
  }
}
