import 'package:dartz/dartz.dart';
import 'package:live_score_app/core/errors/failure.dart';
import 'package:live_score_app/features/search/domain/entities/search_result_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, SearchResultEntity>> search({required String keyword});
}
