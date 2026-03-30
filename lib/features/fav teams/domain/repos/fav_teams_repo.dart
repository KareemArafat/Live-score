import 'package:live_score_app/shard/entities/team_entity.dart';

abstract class FavTeamsRepo {
  Future<void> addFavTeam({required TeamEntity team});

  Future<void> removeFavTeam({required TeamEntity team});

  bool checkFavTeam({required int teamId});

  List<TeamEntity> getAllFavTeams();
}
