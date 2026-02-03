import 'package:equatable/equatable.dart';

class HomeCompetitor extends Equatable {
  final int? id;
  final int? countryId;
  final int? sportId;
  final String? name;
  final String? symbolicName;
  final num? score;
  final bool? isQualified;
  final bool? toQualify;
  final bool? isWinner;
  final String? nameForUrl;
  final int? type;
  final int? popularityRank;
  final int? imageVersion;
  final String? color;
  final String? awayColor;
  final int? mainCompetitionId;
  final bool? hasSquad;
  final bool? hasTransfers;
  final int? competitorNum;
  final bool? hideOnSearch;
  final bool? hideOnCatalog;

  const HomeCompetitor({
    this.id,
    this.countryId,
    this.sportId,
    this.name,
    this.symbolicName,
    this.score,
    this.isQualified,
    this.toQualify,
    this.isWinner,
    this.nameForUrl,
    this.type,
    this.popularityRank,
    this.imageVersion,
    this.color,
    this.awayColor,
    this.mainCompetitionId,
    this.hasSquad,
    this.hasTransfers,
    this.competitorNum,
    this.hideOnSearch,
    this.hideOnCatalog,
  });

  factory HomeCompetitor.fromJson(Map<String, dynamic> json) {
    return HomeCompetitor(
      id: json['id'] as int?,
      countryId: json['countryId'] as int?,
      sportId: json['sportId'] as int?,
      name: json['name'] as String?,
      symbolicName: json['symbolicName'] as String?,
      score: json['score'] as num?,
      isQualified: json['isQualified'] as bool?,
      toQualify: json['toQualify'] as bool?,
      isWinner: json['isWinner'] as bool?,
      nameForUrl: json['nameForURL'] as String?,
      type: json['type'] as int?,
      popularityRank: json['popularityRank'] as int?,
      imageVersion: json['imageVersion'] as int?,
      color: json['color'] as String?,
      awayColor: json['awayColor'] as String?,
      mainCompetitionId: json['mainCompetitionId'] as int?,
      hasSquad: json['hasSquad'] as bool?,
      hasTransfers: json['hasTransfers'] as bool?,
      competitorNum: json['competitorNum'] as int?,
      hideOnSearch: json['hideOnSearch'] as bool?,
      hideOnCatalog: json['hideOnCatalog'] as bool?,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      countryId,
      sportId,
      name,
      symbolicName,
      score,
      isQualified,
      toQualify,
      isWinner,
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
    ];
  }
}
