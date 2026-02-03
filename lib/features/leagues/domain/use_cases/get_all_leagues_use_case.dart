import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/features/leagues/domain/entities/league_entity.dart';
import 'package:live_score_app/features/leagues/domain/repos/leagues_repo.dart';

class GetAllLeaguesUseCase {
  final LeaguesRepo _leaguesRepo;

  GetAllLeaguesUseCase(this._leaguesRepo);

  Future<Either<Failure, List<LeagueEntity>>> execute() async {
    return await _leaguesRepo.getAllLeagues();
  }
}
