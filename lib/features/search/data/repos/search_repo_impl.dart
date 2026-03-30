import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/features/search/data/data%20sources/search_remote_data_source.dart';
import 'package:live_score_app/features/search/domain/entities/search_result_entity.dart';
import 'package:live_score_app/features/search/domain/repos/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl(this.searchRemoteDataSource);

  @override
  Future<Either<Failure, SearchResultEntity>> search({
    required String keyword,
  }) async {
    try {
      final searchResult = await searchRemoteDataSource.search(
        keyword: keyword,
      );
      return right(searchResult);
    } catch (e) {
      if (e is DioException) return left(ServerFailure.fromDio(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
