import 'package:hive/hive.dart';
part 'team_entity.g.dart';

@HiveType(typeId: 0)
class TeamEntity extends HiveObject {
  @HiveField(0)
  final int teamId;
  @HiveField(1)
  final String teamName;
  @HiveField(2)
  final String teamImage;
  @HiveField(3)
  final bool isNational;
  @HiveField(4)
  final int nationalRank;
  @HiveField(5)
  final int countryId;
  @HiveField(6)
  final String countryName;
  @HiveField(7)
  final String countryImage;
  @HiveField(8)
  final int? leagueId;
  @HiveField(9)
  final String? leagueName;
  @HiveField(10)
  final String? leagueImage;

  TeamEntity({
    required this.teamId,
    required this.teamName,
    required this.teamImage,
    required this.isNational,
    required this.nationalRank,
    required this.countryId,
    required this.countryName,
    required this.countryImage,
    this.leagueId,
    this.leagueName,
    this.leagueImage,
  });
}
