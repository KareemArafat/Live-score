import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/shard/entities/table_entity.dart';
import 'package:live_score_app/features/teams/domain/repos/team_repo.dart';

class GetTeamStandingUseCase {
  final TeamRepo _teamRepo;

  GetTeamStandingUseCase(this._teamRepo);

  Future<Either<Failure, TableEntity>> execute({
    required int teamId,
    required int? leagueId,
  }) {
    return _teamRepo.getTeamStanding(teamId: teamId, leagueId: leagueId);
  }
}
