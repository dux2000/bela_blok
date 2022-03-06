// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fast_game.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FastGameAdapter extends TypeAdapter<FastGame> {
  @override
  final int typeId = 1;

  @override
  FastGame read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FastGame(
      gameType: fields[0] as int,
    )
      ..miScores = (fields[1] as List).cast<int>()
      ..viScores = (fields[2] as List).cast<int>();
  }

  @override
  void write(BinaryWriter writer, FastGame obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.gameType)
      ..writeByte(1)
      ..write(obj.miScores)
      ..writeByte(2)
      ..write(obj.viScores);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FastGameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
