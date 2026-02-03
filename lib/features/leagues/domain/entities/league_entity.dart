import 'package:equatable/equatable.dart';

class LeagueEntity extends Equatable {
  final int leagueId;
  final String leagueName;
  final String leagueImage;
  final int countryId;
  final String countryName;
  final String? countryFlag;

  const LeagueEntity({
    required this.leagueId,
    required this.leagueName,
    required this.leagueImage,
    required this.countryId,
    required this.countryName,
    this.countryFlag,
  });

  @override
  List<Object?> get props => [
    leagueId,
    leagueName,
    leagueImage,
    countryId,
    countryName,
    countryFlag,
  ];
}
