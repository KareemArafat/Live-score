part of 'all_leagues_cubit.dart';

sealed class AllLeaguesState extends Equatable {
  const AllLeaguesState();

  @override
  List<Object> get props => [];
}

final class AllLeaguesInitial extends AllLeaguesState {}

final class AllLeaguesLoading extends AllLeaguesState {}

final class AllLeaguesSuccess extends AllLeaguesState {
  final List<LeagueEntity> leaguesList;
  const AllLeaguesSuccess({required this.leaguesList});
}

final class AllLeaguesFailure extends AllLeaguesState {
  final String errorMess;
  const AllLeaguesFailure({required this.errorMess});
}
