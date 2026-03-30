import 'package:dio/dio.dart';
import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/core/api/api_service.dart';
import 'package:live_score_app/features/search/data/models/search_result_model.dart';

abstract class SearchRemoteDataSource {
  Future<SearchResultModel> search({required String keyword});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiServices apiServices;
  CancelToken? cancelToken;
  final Map<String, dynamic> cache = {};

  SearchRemoteDataSourceImpl(this.apiServices);

  @override
  Future<SearchResultModel> search({required String keyword}) async {
    cancelToken?.cancel();
    cancelToken = CancelToken();

    if (cache.containsKey(keyword)) {
      return cache[keyword];
    }

    var result = await apiServices.get(
      endPoint: ApiConst.searchEndPoint(keyword),
      cancelToken: cancelToken,
    );

    final resultModel = SearchResultModel.fromJson(result);
    cache[keyword] = resultModel;
    return resultModel;
  }
}
