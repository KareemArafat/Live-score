import 'package:dio/dio.dart';
import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/core/api/api_service.dart';
import 'package:live_score_app/shard/models/match_model.dart';

abstract class DayMatchesRemoteDataSource {
  Future<List<MatchModel>> getDayMatches({String? day});
}

class DayMatchesRemoteDataSourceImpl extends DayMatchesRemoteDataSource {
  final ApiServices _apiServices;
  CancelToken? cancelToken;
  final Map<String, dynamic> cache = {};
  DayMatchesRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<MatchModel>> getDayMatches({String? day}) async {
    final key = day ?? 'today';
    if (cache.containsKey(key)) {
      return cache[key];
    }

    cancelToken?.cancel();
    cancelToken = CancelToken();

    var response = await _apiServices.get(
      endPoint: ApiConst.dayMatchesEndPoint(day),
      cancelToken: cancelToken,
    );

    List<MatchModel> matches = [];
    for (var item in response['games']) {
      matches.add(MatchModel.fromJson(item));
    }

    cache[key] = matches;
    return matches;
  }
}
