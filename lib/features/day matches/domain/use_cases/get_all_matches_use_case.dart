import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/features/day%20matches/domain/repos/day_matches_repo.dart';
import 'package:live_score_app/shard/entities/match_entity.dart';

class GetAllMatchesUseCase {
  final DayMatchesRepo _dayMatchesRepo;

  GetAllMatchesUseCase(this._dayMatchesRepo);

  Future<Either<Failure, List<MatchEntity>>> execute({String? day}) async {
    return await _dayMatchesRepo.getAllMatches(day: day);
  }
}
