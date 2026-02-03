import 'package:equatable/equatable.dart';

class PlayerStatsInfo extends Equatable {
  const PlayerStatsInfo({
    required this.id,
    required this.name,
    required this.shortName,
    required this.nameForUrl,
    required this.countryId,
    required this.competitorId,
    required this.competitionId,
    required this.positionName,
    required this.positionShortName,
    required this.imageVersion,
  });

  final int? id;
  final String? name;
  final String? shortName;
  final String? nameForUrl;
  final int? countryId;
  final int? competitorId;
  final int? competitionId;
  final String? positionName;
  final String? positionShortName;
  final num? imageVersion;

  factory PlayerStatsInfo.fromJson(Map<String, dynamic> json) {
    return PlayerStatsInfo(
      id: json["id"],
      name: json["name"],
      shortName: json["shortName"],
      nameForUrl: json["nameForURL"],
      countryId: json["countryId"],
      competitorId: json["competitorId"],
      competitionId: json["competitionId"],
      positionName: json["positionName"],
      positionShortName: json["positionShortName"],
      imageVersion: json["imageVersion"],
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    shortName,
    nameForUrl,
    countryId,
    competitorId,
    competitionId,
    positionName,
    positionShortName,
    imageVersion,
  ];
}
