import 'package:equatable/equatable.dart';

class LeagueEntity extends Equatable {
  final int leagueId;
  final String leagueName;
  final String leagueImage;
  final int? countryId;
  final String? countryName;
  final String? countryImage;
  final bool standings;
  final bool liveStandings;
  final bool stats;
  final bool groups;

  const LeagueEntity({
    required this.leagueId,
    required this.leagueName,
    required this.leagueImage,
    this.countryId,
    this.countryName,
    this.countryImage,
    this.standings = true,
    this.liveStandings = false,
    this.stats = true,
    this.groups = false,
  });

  @override
  List<Object?> get props => [
    leagueId,
    leagueName,
    leagueImage,
    countryId,
    countryName,
    countryImage,
    standings,
    liveStandings,
    stats,
    groups,
  ];
}
