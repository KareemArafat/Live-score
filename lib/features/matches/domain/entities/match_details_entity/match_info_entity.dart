class MatchInfoEntity {
  final String startTime;
  final String leagueName;
  final String leagueImage;
  final String? venueName;
  final int? venueCapacity;
  final String? officialName;

  MatchInfoEntity({
    required this.startTime,
    required this.leagueName,
    required this.leagueImage,
    required this.venueName,
    required this.venueCapacity,
    required this.officialName,
  });
}
