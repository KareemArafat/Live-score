import 'package:equatable/equatable.dart';

class CountryModel extends Equatable {
  final int? id;
  final String? name;
  final int? totalGames;
  final int? liveGames;
  final String? nameForUrl;
  final int? imageVersion;
  final List<dynamic>? sportTypes;
  final bool? isInternational;

  const CountryModel({
    this.id,
    this.name,
    this.totalGames,
    this.liveGames,
    this.nameForUrl,
    this.imageVersion,
    this.sportTypes,
    this.isInternational,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    totalGames: json['totalGames'] as int?,
    liveGames: json['liveGames'] as int?,
    nameForUrl: json['nameForURL'] as String?,
    imageVersion: json['imageVersion'] as int?,
    sportTypes: json['sportTypes'] as List<dynamic>?,
    isInternational: json['isInternational'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'totalGames': totalGames,
    'liveGames': liveGames,
    'nameForURL': nameForUrl,
    'imageVersion': imageVersion,
    'sportTypes': sportTypes,
    'isInternational': isInternational,
  };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      totalGames,
      liveGames,
      nameForUrl,
      imageVersion,
      sportTypes,
      isInternational,
    ];
  }
}
