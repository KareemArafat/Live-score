import 'package:equatable/equatable.dart';

class Competitors extends Equatable {
  const Competitors({
    required this.id,
    required this.countryId,
    required this.sportId,
    required this.name,
    required this.symbolicName,
    required this.nameForUrl,
    required this.type,
    required this.popularityRank,
    required this.imageVersion,
    required this.color,
    required this.awayColor,
    required this.mainCompetitionId,
    required this.hasSquad,
    required this.hasTransfers,
    required this.competitorNum,
    required this.hideOnSearch,
    required this.hideOnCatalog,
    required this.shortName,
    required this.longName,
  });

  final int? id;
  final num? countryId;
  final num? sportId;
  final String? name;
  final String? symbolicName;
  final String? nameForUrl;
  final num? type;
  final num? popularityRank;
  final num? imageVersion;
  final String? color;
  final String? awayColor;
  final num? mainCompetitionId;
  final bool? hasSquad;
  final bool? hasTransfers;
  final num? competitorNum;
  final bool? hideOnSearch;
  final bool? hideOnCatalog;
  final String? shortName;
  final String? longName;

  factory Competitors.fromJson(Map<String, dynamic> json) {
    return Competitors(
      id: json["id"],
      countryId: json["countryId"],
      sportId: json["sportId"],
      name: json["name"],
      symbolicName: json["symbolicName"],
      nameForUrl: json["nameForURL"],
      type: json["type"],
      popularityRank: json["popularityRank"],
      imageVersion: json["imageVersion"],
      color: json["color"],
      awayColor: json["awayColor"],
      mainCompetitionId: json["mainCompetitionId"],
      hasSquad: json["hasSquad"],
      hasTransfers: json["hasTransfers"],
      competitorNum: json["competitorNum"],
      hideOnSearch: json["hideOnSearch"],
      hideOnCatalog: json["hideOnCatalog"],
      shortName: json["shortName"],
      longName: json["longName"],
    );
  }

  @override
  List<Object?> get props => [
    id,
    countryId,
    sportId,
    name,
    symbolicName,
    nameForUrl,
    type,
    popularityRank,
    imageVersion,
    color,
    awayColor,
    mainCompetitionId,
    hasSquad,
    hasTransfers,
    competitorNum,
    hideOnSearch,
    hideOnCatalog,
    shortName,
    longName,
  ];
}
