import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';

abstract class DayMatchesRepo {
  Future<Either<Failure, List<MatchEntity>>> getAllMatches({String? day});
  List<MatchEntity> getFavMatches({required List<MatchEntity> allMatches});
}
