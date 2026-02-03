part of 'team_news_cubit.dart';

sealed class TeamNewsState extends Equatable {
  const TeamNewsState();

  @override
  List<Object> get props => [];
}

final class TeamNewsInitial extends TeamNewsState {}

final class TeamNewsLoading extends TeamNewsState {}

final class TeamNewsSuccess extends TeamNewsState {
  final List<NewsEntity> news;
  const TeamNewsSuccess({required this.news});
}

final class TeamNewsFailure extends TeamNewsState {
  final String errMess;
  const TeamNewsFailure({required this.errMess});
}
