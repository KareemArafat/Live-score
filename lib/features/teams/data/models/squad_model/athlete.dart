import 'package:live_score_app/core/api/api_const.dart';
import 'package:live_score_app/core/utils/functions.dart';
import 'package:live_score_app/features/teams/data/models/squad_model/athlete_position.dart';
import 'package:live_score_app/features/teams/data/models/squad_model/formation_position.dart';
import 'package:live_score_app/features/teams/domain/entities/squad_player_entity.dart';

class Athlete extends SquadPlayerEntity {
  Athlete({
    required this.age,
    required this.jerseyNum,
    required this.birthdate,
    required this.gender,
    required this.position,
    required this.formationPosition,
    required this.height,
    required this.id,
    required this.name,
    required this.shortName,
    required this.nameForUrl,
    required this.sportId,
    required this.clubId,
    required this.nationalityId,
    required this.nationalTeamId,
    required this.imageVersion,
  }) : super(
         playerId: id ?? 0,
         playerName: name ?? 'UnKnown Player',
         playerPhoto: ApiConst.playerTeamImage(id ?? 0),
         playerNumber: jerseyNum ?? 0,
         countryId: nationalityId ?? 0,
         countryName: getCountryName(nationalityId ?? 0),
         countryFlag: ApiConst.teamImage(nationalTeamId ?? 0),
         positionId: position?.id ?? 100,
         positionName: formationPosition?.name ?? '',
       );

  final int? age;
  final int? jerseyNum;
  final DateTime? birthdate;
  final int? gender;
  final AthletePosition? position;
  final FormationPosition? formationPosition;
  final int? height;
  final int? id;
  final String? name;
  final String? shortName;
  final String? nameForUrl;
  final int? sportId;
  final int? clubId;
  final int? nationalityId;
  final int? nationalTeamId;
  final int? imageVersion;

  factory Athlete.fromJson(Map<String, dynamic> json) {
    return Athlete(
      age: json["age"],
      jerseyNum: json["jerseyNum"],
      birthdate: DateTime.tryParse(json["birthdate"] ?? ""),
      gender: json["gender"],
      position: json["position"] == null
          ? null
          : AthletePosition.fromJson(json["position"]),
      formationPosition: json["formationPosition"] == null
          ? null
          : FormationPosition.fromJson(json["formationPosition"]),
      height: json["height"],
      id: json["id"],
      name: json["name"],
      shortName: json["shortName"],
      nameForUrl: json["nameForURL"],
      sportId: json["sportId"],
      clubId: json["clubId"],
      nationalityId: json["nationalityId"],
      nationalTeamId: json["nationalTeamId"],
      imageVersion: json["imageVersion"],
    );
  }
}
