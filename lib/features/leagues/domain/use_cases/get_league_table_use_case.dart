import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/shard/entities/table_entity.dart';
import 'package:live_score_app/features/leagues/domain/repos/leagues_repo.dart';

class GetLeagueTableUseCase {
  final LeaguesRepo _leaguesRepo;
  GetLeagueTableUseCase(this._leaguesRepo);

  Future<Either<Failure, TableEntity>> execute({
    required int leagueId,
    int? season,
  }) async {
    return await _leaguesRepo.getLeagueTable(
      leagueId: leagueId,
      season: season,
    );
  }
}
