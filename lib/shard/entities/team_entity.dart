import 'package:hive/hive.dart';

part 'team_entity.g.dart';

@HiveType(typeId: 0)
class TeamEntity extends HiveObject {
  @HiveField(0)
  final int teamId;
  @HiveField(1)
  final String teamLogo;
  @HiveField(2)
  final String teamName;
  @HiveField(3)
  final int countryId;
  @HiveField(4)
  final String countryName;
  @HiveField(5)
  final String countryFlag;
  @HiveField(6)
  final int leagueId;

  TeamEntity({
    required this.teamId,
    required this.teamLogo,
    required this.teamName,
    required this.countryId,
    required this.countryName,
    required this.countryFlag,
    required this.leagueId,
  });
}
