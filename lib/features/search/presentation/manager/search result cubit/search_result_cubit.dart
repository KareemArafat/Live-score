import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score_app/features/search/domain/entities/search_result_entity.dart';
import 'package:live_score_app/features/search/domain/use_cases/search_use_case.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit(this.searchUseCase) : super(SearchResultInitial());

  final SearchUseCase searchUseCase;
  String lastQuery = '';

  Future<List<SearchResultEntity>> getSuggestions(String keyword) async {
    if (keyword.length < 2 || keyword.length > 8) return [];
    if (keyword == lastQuery) return [];

    final result = await searchUseCase.execute(keyword: keyword);

    return result.fold((l) => [], (r) {
      lastQuery = keyword;
      return [r];
    });
  }
}
