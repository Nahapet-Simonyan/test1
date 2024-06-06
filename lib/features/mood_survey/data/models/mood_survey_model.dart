// Package imports:
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

// Project imports:
import 'package:test1/core/constants/storage.dart';
import 'package:test1/core/enums/enums.dart';

part 'mood_survey_model.g.dart';

@HiveType(typeId: AppStorage.moodSurveyId)
class MoodSurveyModel extends Equatable {
  @HiveField(0)
  final MoodType moodType;
  @HiveField(1)
  final double stressLevel;
  @HiveField(2)
  final double selfRating;
  @HiveField(3)
  final String notes;
  @HiveField(4)
  final String date;

  const MoodSurveyModel({
    required this.moodType,
    required this.stressLevel,
    required this.selfRating,
    required this.notes,
    required this.date,
  });

  @override
  List<Object?> get props => [moodType, stressLevel, selfRating, notes, date];
}
