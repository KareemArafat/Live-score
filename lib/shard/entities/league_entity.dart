class LeagueEntity {
  final int leagueId;
  final String leagueName;
  final String leagueImage;
  final int countryId;
  final String countryName;
  final String countryImage;
  final bool standings;
  final bool stats;
  final int seasonNum;
  final bool isNational;

  const LeagueEntity({
    required this.leagueId,
    required this.leagueName,
    required this.leagueImage,
    required this.countryId,
    required this.countryName,
    required this.countryImage,
    required this.standings,
    required this.stats,
    required this.seasonNum,
    required this.isNational,
  });
}
