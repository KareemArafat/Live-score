import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/core/api/api_service.dart';
import 'package:live_score_app/features/teams/data/models/squad_model/squad_model.dart';
import 'package:live_score_app/shard/models/matches_list_model/matches_list_model.dart';
import 'package:live_score_app/shard/models/table_model.dart/table_model.dart';
import 'package:live_score_app/shard/models/news_model/news_model.dart';

abstract class TeamRemoteDataSource {
  Future<SquadModel> getSquadPlayers({required int teamId});
  Future<MatchesListModel> getTeamMatches({required int teamId});
  Future<MatchesListModel> getMoreTeamMatches({required String pageUrl});
  Future<TableModel> getTeamStanding({
    required int teamId,
    required int? leagueId,
  });
  Future<NewsModel> getTeamNews({required int teamId});
}

class TeamRemoteDataSourceImpl extends TeamRemoteDataSource {
  final ApiServices _apiServices;
  TeamRemoteDataSourceImpl(this._apiServices);

  @override
  Future<SquadModel> getSquadPlayers({required int teamId}) async {
    var response = await _apiServices.get(
      endPoint: ApiConst.teamSquadEndPoint(teamId),
    );
    return SquadModel.fromJson(response);
  }

  @override
  Future<MatchesListModel> getTeamMatches({required int teamId}) async {
    var response = await _apiServices.get(
      endPoint: ApiConst.teamMatchesEndPoint(teamId),
    );
    return MatchesListModel.fromJson(response);
  }

  @override
  Future<MatchesListModel> getMoreTeamMatches({required String pageUrl}) async {
    final response = await _apiServices.get(
      endPoint: 'https://webws.365scores.com$pageUrl ',
    );
    return MatchesListModel.fromJson(response);
  }

  @override
  Future<TableModel> getTeamStanding({
    required int teamId,
    required int? leagueId,
  }) async {
    var response = await _apiServices.get(
      endPoint: ApiConst.teamStandingEndPoint(teamId, leagueId),
    );
    return TableModel.fromJson(response);
  }

  @override
  Future<NewsModel> getTeamNews({required int teamId}) async {
    var response = await _apiServices.get(
      endPoint: ApiConst.teamNewsEndPoint(teamId),
    );
    return NewsModel.fromJson(response);
  }
}
