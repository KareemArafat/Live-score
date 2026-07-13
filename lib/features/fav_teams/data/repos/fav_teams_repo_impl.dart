import 'package:live_score_app/features/fav_teams/data/data_source/fav_teams_local_data_source.dart';
import 'package:live_score_app/features/fav_teams/domain/repos/fav_teams_repo.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';

class FavTeamsRepoImpl extends FavTeamsRepo {
  final FavTeamsLocalDataSource _favTeamsLocalDataSource;

  FavTeamsRepoImpl(this._favTeamsLocalDataSource);

  @override
  Future<void> addFavTeam({required TeamEntity team}) async {
    await _favTeamsLocalDataSource.addFavTeam(team: team);
  }

  @override
  Future<void> removeFavTeam({required TeamEntity team}) async {
    await _favTeamsLocalDataSource.removeFavTeam(team: team);
  }

  @override
  bool checkFavTeam({required int teamId}) {
    return _favTeamsLocalDataSource.checkFavTeam(teamId: teamId);
  }

  @override
  List<TeamEntity> getAllFavTeams() {
    return _favTeamsLocalDataSource.getAllFavTeams();
  }
}
