import 'package:hive_flutter/hive_flutter.dart';
import 'package:live_score_app/core/utils/app_const.dart';
import 'package:live_score_app/shard/entities/team_entity.dart';

abstract class FavTeamsLocalDataSource {
  Future<void> addFavTeam({required TeamEntity team});

  Future<void> removeFavTeam({required TeamEntity team});

  bool checkFavTeam({required int teamId});

  List<TeamEntity> getAllFavTeams();
}

class FavTeamsLocalDataSourceImpl extends FavTeamsLocalDataSource {
  @override
  Future<void> addFavTeam({required TeamEntity team}) async {
    var box = Hive.box<TeamEntity>(AppConst.kFavTeam);
    await box.put(team.teamId, team);
  }

  @override
  Future<void> removeFavTeam({required TeamEntity team}) async {
    var box = Hive.box<TeamEntity>(AppConst.kFavTeam);
    await box.delete(team.teamId);
  }

  @override
  bool checkFavTeam({required int teamId}) {
    var box = Hive.box<TeamEntity>(AppConst.kFavTeam);
    return box.containsKey(teamId);
  }

  @override
  List<TeamEntity> getAllFavTeams() {
    var box = Hive.box<TeamEntity>(AppConst.kFavTeam);
    return box.values.toList();
  }
}
