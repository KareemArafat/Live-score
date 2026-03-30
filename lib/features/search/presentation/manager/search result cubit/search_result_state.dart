part of 'search_result_cubit.dart';

sealed class SearchResultState extends Equatable {
  const SearchResultState();

  @override
  List<Object> get props => [];
}

final class SearchResultInitial extends SearchResultState {}

final class SearchResultLoading extends SearchResultState {}

final class SearchResultSuccess extends SearchResultState {
  final SearchResultEntity searchResult;
  const SearchResultSuccess({required this.searchResult});
}

final class SearchResultFailure extends SearchResultState {

  const SearchResultFailure();
}
