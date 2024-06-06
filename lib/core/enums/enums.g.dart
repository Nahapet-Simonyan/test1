// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoodTypeAdapter extends TypeAdapter<MoodType> {
  @override
  final int typeId = 1;

  @override
  MoodType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MoodType.joy;
      case 1:
        return MoodType.fear;
      case 2:
        return MoodType.rabies;
      case 3:
        return MoodType.sadness;
      case 4:
        return MoodType.calmness;
      case 5:
        return MoodType.force;
      default:
        return MoodType.joy;
    }
  }

  @override
  void write(BinaryWriter writer, MoodType obj) {
    switch (obj) {
      case MoodType.joy:
        writer.writeByte(0);
        break;
      case MoodType.fear:
        writer.writeByte(1);
        break;
      case MoodType.rabies:
        writer.writeByte(2);
        break;
      case MoodType.sadness:
        writer.writeByte(3);
        break;
      case MoodType.calmness:
        writer.writeByte(4);
        break;
      case MoodType.force:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
