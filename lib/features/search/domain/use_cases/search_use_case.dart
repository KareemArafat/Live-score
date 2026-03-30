import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/features/search/domain/entities/search_result_entity.dart';
import 'package:live_score_app/features/search/domain/repos/search_repo.dart';

class SearchUseCase {
  final SearchRepo searchRepo;

  SearchUseCase(this.searchRepo);

  Future<Either<Failure, SearchResultEntity>> execute({
    required String keyword,
  }) async {
    return await searchRepo.search(keyword: keyword);
  }
}
