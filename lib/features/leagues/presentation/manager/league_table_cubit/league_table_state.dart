part of 'league_table_cubit.dart';

sealed class LeagueTableState extends Equatable {
  const LeagueTableState();

  @override
  List<Object> get props => [];
}

final class TableInitial extends LeagueTableState {}

final class TableLoading extends LeagueTableState {}

final class TableSuccess extends LeagueTableState {
  final TableEntity table;
  const TableSuccess({required this.table});
}

final class TableFailure extends LeagueTableState {
  final String errorMess;
  const TableFailure({required this.errorMess});
}
