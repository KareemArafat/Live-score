import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/core/api/api_service.dart';
import 'package:live_score_app/shard/models/matches_model/game.dart';

abstract class DayMatchesRemoteDataSource {
  Future<List<Game>> getDayMatches({String? day});
}

class DayMatchesRemoteDataSourceImpl extends DayMatchesRemoteDataSource {
  final ApiServices _apiServices;
  DayMatchesRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<Game>> getDayMatches({String? day}) async {
    var response = await _apiServices.get(
      endPoint: ApiConst.dayMatchesEndPoint(day),
    );
    List<Game> matches = [];
    for (var item in response['games']) {
      matches.add(Game.fromJson(item));
    }
    return matches;
  }
}
