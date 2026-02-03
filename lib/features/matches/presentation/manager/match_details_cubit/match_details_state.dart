part of 'match_details_cubit.dart';

sealed class MatchDetailsState extends Equatable {
  const MatchDetailsState();

  @override
  List<Object> get props => [];
}

final class MatchDetailsInitial extends MatchDetailsState {}

final class MatchDetailsLoading extends MatchDetailsState {}

final class MatchDetailsSuccess extends MatchDetailsState {
  final MatchDetailsEntity matchDetails;
  const MatchDetailsSuccess({required this.matchDetails});
}

final class MatchDetailsFailure extends MatchDetailsState {
  final String errMess;
  const MatchDetailsFailure({required this.errMess});
}
