part of 'league_news_cubit.dart';

sealed class LeagueNewsState extends Equatable {
  const LeagueNewsState();

  @override
  List<Object> get props => [];
}

final class NewsInitial extends LeagueNewsState {}

final class NewsLoading extends LeagueNewsState {}

final class NewsSuccess extends LeagueNewsState {
  final List<NewsEntity> newsList;
  const NewsSuccess({required this.newsList});
}

final class NewsFailure extends LeagueNewsState {
  final String errMess;
  const NewsFailure({required this.errMess});
}
