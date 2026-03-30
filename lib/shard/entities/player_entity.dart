import 'package:equatable/equatable.dart';

class PlayerEntity extends Equatable {
  final int playerId;
  final String playerName;
  final String playerImage;
  final int? playerNum;
  final int? teamId;
  final String? teamName;
  final String? teamImage;
  final int? leagueId;
  final String? leagueName;
  final String? leagueImage;
  final int? countryId;
  final String? countryName;
  final String? countryImage;

  const PlayerEntity({
    required this.playerId,
    required this.playerName,
    required this.playerImage,
    this.playerNum,
    this.teamId,
    this.teamName,
    this.teamImage,
    this.leagueId,
    this.leagueName,
    this.leagueImage,
    this.countryId,
    this.countryName,
    this.countryImage,
  });

  @override
  List<Object?> get props => [
    playerId,
    playerName,
    playerImage,
    playerNum,
    teamId,
    teamName,
    teamImage,
    leagueId,
    leagueName,
    leagueImage,
    countryId,
    countryName,
    countryImage,
  ];
}
