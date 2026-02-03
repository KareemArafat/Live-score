import 'package:equatable/equatable.dart';

class SquadPlayerEntity extends Equatable {
  final int playerId;
  final String playerName;
  final String playerPhoto;
  final int playerNumber;
  final int countryId;
  final String countryName;
  final String countryFlag;
  final int positionId;
  final String positionName;

  const SquadPlayerEntity({
    required this.playerId,
    required this.playerName,
    required this.playerPhoto,
    required this.playerNumber,
    required this.countryId,
    required this.countryName,
    required this.countryFlag,
    required this.positionId,
    required this.positionName,
  });

  @override
  List<Object?> get props => [
    playerId,
    playerName,
    playerPhoto,
    playerNumber,
    countryId,
    countryName,
    countryFlag,
    positionId,
    positionName,
  ];
}
