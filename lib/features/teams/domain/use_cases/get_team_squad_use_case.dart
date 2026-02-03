import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/features/teams/domain/entities/squad_entity.dart';
import 'package:live_score_app/features/teams/domain/repos/team_repo.dart';

class GetTeamSquadUseCase {
  final TeamRepo _teamRepo;

  GetTeamSquadUseCase(this._teamRepo);

  Future<Either<Failure, SquadEntity>> execute({required int teamId}) {
    return _teamRepo.getTeamSquad(teamId: teamId);
  }
}
