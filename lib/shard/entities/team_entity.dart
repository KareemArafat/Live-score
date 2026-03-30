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
  final int? countryId;
  @HiveField(4)
  final String? countryName;
  @HiveField(5)
  final String? countryImage;
  @HiveField(6)
  final int? leagueId;
  @HiveField(7)
  final String? leagueName;
  @HiveField(8)
  final String? leagueImage;

  TeamEntity({
    required this.teamId,
    required this.teamName,
    required this.teamImage,
    this.countryId,
    this.countryName,
    this.countryImage,
    this.leagueId,
    this.leagueName,
    this.leagueImage,
  });
}
