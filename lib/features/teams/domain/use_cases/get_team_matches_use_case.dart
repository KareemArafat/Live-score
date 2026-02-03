import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/features/teams/domain/repos/team_repo.dart';
import 'package:live_score_app/shard/entities/league_matches_entity.dart';

class GetTeamMatchesUseCase {
  final TeamRepo _teamRepo;

  GetTeamMatchesUseCase(this._teamRepo);

  Future<Either<Failure, LeagueMatchesEntity>> execute({required int teamId}) {
    return _teamRepo.getTeamMatches(teamId: teamId);
  }
}
