import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/core/api/api_service.dart';
import 'package:live_score_app/features/matches/data/models/match_details_model/match_details_model.dart';
import 'package:live_score_app/features/matches/data/models/match_total_stats_model/match_total_stats_model.dart';

abstract class MatchDetailsRemoteDataSource {
  Future<MatchDetailsModel> getMatchDetails({required int matchId});
  Future<MatchTotalStatsModel> getMatchStats({required int matchId});
}

class MatchDetailsRemoteDataSourceImpl extends MatchDetailsRemoteDataSource {
  final ApiServices _apiServices;

  MatchDetailsRemoteDataSourceImpl(this._apiServices);

  @override
  Future<MatchDetailsModel> getMatchDetails({required int matchId}) async {
    var response = await _apiServices.get(
      endPoint: ApiConst.matchDetailsEndPoint(matchId),
    );
    MatchDetailsModel matchDetails = MatchDetailsModel.fromJson(
      response['game'],
    );
    return matchDetails;
  }

  @override
  Future<MatchTotalStatsModel> getMatchStats({required int matchId}) async {
    var response = await _apiServices.get(
      endPoint: ApiConst.matchStatsEndPoint(matchId),
    );
    MatchTotalStatsModel matchStats = MatchTotalStatsModel.fromJson(response);
    return matchStats;
  }
}
