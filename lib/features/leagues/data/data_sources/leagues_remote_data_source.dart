import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/core/api/api_service.dart';
import 'package:live_score_app/features/leagues/data/models/league_stats_model/league_stats_model.dart';
import 'package:live_score_app/shard/models/matches_list_model/matches_list_model.dart';
import 'package:live_score_app/shard/models/table_model.dart/table_model.dart';
import 'package:live_score_app/shard/models/news_model/news_model.dart';
import 'package:live_score_app/shard/models/league_model.dart';

abstract class LeaguesRemoteDataSource {
  Future<List<LeagueModel>> getAllLeagues();
  Future<TableModel> getLeagueTable({required int leagueId, int? season});
  Future<MatchesListModel> getLeagueMatches({required int leagueId});
  Future<MatchesListModel> getMoreLeagueMatches({required String pageUrl});
  Future<LeagueStatsModel> getLeaguePlayersStats({required int leagueId});
  Future<NewsModel> getLeagueNews({required int leagueId});
}

class LeaguesRemoteDataSourceImpl extends LeaguesRemoteDataSource {
  final ApiServices _apiServices;
  LeaguesRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<LeagueModel>> getAllLeagues() async {
    final response = await _apiServices.get(
      endPoint: ApiConst.allLeaguesEndPoint(),
    );
    final List<LeagueModel> leagues = [];
    for (var item in response['competitions']) {
      leagues.add(LeagueModel.fromJson(item));
    }
    return leagues;
  }

  @override
  Future<TableModel> getLeagueTable({
    required int leagueId,
    int? season,
  }) async {
    var response = await _apiServices.get(
      endPoint: ApiConst.leagueTableEndPoint(leagueId, season),
    );
    return TableModel.fromJson(response);
  }

  @override
  Future<MatchesListModel> getLeagueMatches({required int leagueId}) async {
    var response = await _apiServices.get(
      endPoint: ApiConst.leagueMatchesEndPoint(leagueId),
    );
    return MatchesListModel.fromJson(response);
  }

  @override
  Future<MatchesListModel> getMoreLeagueMatches({
    required String pageUrl,
  }) async {
    var response = await _apiServices.get(
      endPoint: ApiConst.leagueMoreMatchesEndPoint(pageUrl),
    );
    return MatchesListModel.fromJson(response);
  }

  @override
  Future<LeagueStatsModel> getLeaguePlayersStats({
    required int leagueId,
  }) async {
    var response = await _apiServices.get(
      endPoint: ApiConst.leagueStatsEndPoint(leagueId),
    );
    return LeagueStatsModel.fromJson(response);
  }

  @override
  Future<NewsModel> getLeagueNews({required int leagueId}) async {
    final response = await _apiServices.get(
      endPoint: ApiConst.leagueNewsEndPoint(leagueId),
    );
    return NewsModel.fromJson(response);
  }
}
