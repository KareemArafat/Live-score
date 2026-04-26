import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/shard/entities/player_entity.dart';

class SearchAthlete extends PlayerEntity {
  SearchAthlete({
    required this.age,
    required this.gender,
    required this.popularityRank,
    required this.id,
    required this.name,
    required this.shortName,
    required this.nameForUrl,
    required this.sportId,
    required this.clubId,
    required this.nationalityId,
    required this.imageVersion,
    required this.clubName,
    required this.createdAt,
  }) : super(
         playerId: id,
         playerName: name,
         playerImage: ApiConst.playerTeamImage(id),
         teamId: clubId,
         teamName: clubName,
         teamImage: ApiConst.teamImage(clubId),
         countryId: nationalityId,
         countryName: getCountryName(nationalityId),
       );

  final int age;
  final int gender;
  final int popularityRank;
  final int id;
  final String name;
  final String shortName;
  final String nameForUrl;
  final int sportId;
  final int clubId;
  final int nationalityId;
  final int imageVersion;
  final String clubName;
  final DateTime? createdAt;

  factory SearchAthlete.fromJson(Map<String, dynamic> json) {
    return SearchAthlete(
      age: json["age"] ?? 0,
      gender: json["gender"] ?? 0,
      popularityRank: json["popularityRank"] ?? 0,
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      shortName: json["shortName"] ?? "",
      nameForUrl: json["nameForURL"] ?? "",
      sportId: json["sportId"] ?? 0,
      clubId: json["clubId"] ?? 0,
      nationalityId: json["nationalityId"] ?? 0,
      imageVersion: json["imageVersion"] ?? 0,
      clubName: json["clubName"] ?? "",
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
    );
  }
}
