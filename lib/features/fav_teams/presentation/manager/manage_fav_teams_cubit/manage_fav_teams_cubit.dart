import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/fav_teams/domain/repos/fav_teams_repo.dart';
import 'package:live_score_app/features/fav_teams/presentation/manager/manage_fav_teams_cubit/manage_fav_teams_state.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';

class ManageFavTeamsCubit extends Cubit<ManageFavTeamsState> {
  ManageFavTeamsCubit(this._favTeamsRepo) : super(ManageFavTeamsInitial());
  final FavTeamsRepo _favTeamsRepo;

  bool checkFavTeam({required int teamId}) {
    return _favTeamsRepo.checkFavTeam(teamId: teamId);
  }

  void getFavTeams() {
    emit(GetFavTeamsLoading());
    var result = _favTeamsRepo.getAllFavTeams();
    emit(GetFavTeamsSuccess(teams: result));
  }

  Future<void> addFavTeam({required TeamEntity team}) async {
    await _favTeamsRepo.addFavTeam(team: team);
  }

  Future<void> removeFavTeam({required TeamEntity team}) async {
    await _favTeamsRepo.removeFavTeam(team: team);
  }
}
