// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_survey_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoodSurveyModelAdapter extends TypeAdapter<MoodSurveyModel> {
  @override
  final int typeId = 2;

  @override
  MoodSurveyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoodSurveyModel(
      moodType: fields[0] as MoodType,
      stressLevel: fields[1] as double,
      selfRating: fields[2] as double,
      notes: fields[3] as String,
      date: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MoodSurveyModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.moodType)
      ..writeByte(1)
      ..write(obj.stressLevel)
      ..writeByte(2)
      ..write(obj.selfRating)
      ..writeByte(3)
      ..write(obj.notes)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodSurveyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
