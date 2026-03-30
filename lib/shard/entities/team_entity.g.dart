// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeamEntityAdapter extends TypeAdapter<TeamEntity> {
  @override
  final int typeId = 0;

  @override
  TeamEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeamEntity(
      teamId: fields[0] as int,
      teamName: fields[1] as String,
      teamImage: fields[2] as String,
      countryId: fields[3] as int?,
      countryName: fields[4] as String?,
      countryImage: fields[5] as String?,
      leagueId: fields[6] as int?,
      leagueName: fields[7] as String?,
      leagueImage: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TeamEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.teamId)
      ..writeByte(1)
      ..write(obj.teamName)
      ..writeByte(2)
      ..write(obj.teamImage)
      ..writeByte(3)
      ..write(obj.countryId)
      ..writeByte(4)
      ..write(obj.countryName)
      ..writeByte(5)
      ..write(obj.countryImage)
      ..writeByte(6)
      ..write(obj.leagueId)
      ..writeByte(7)
      ..write(obj.leagueName)
      ..writeByte(8)
      ..write(obj.leagueImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeamEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
