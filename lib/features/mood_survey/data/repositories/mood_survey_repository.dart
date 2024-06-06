// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import '../../domain/repositories/i_mood_survey_repository.dart';
import '../models/mood_survey_model.dart';

class MoodSurveyRepository implements IMoodSurveyRepository {
  final Box<MoodSurveyModel> moodSurveyBox;

  MoodSurveyRepository({required this.moodSurveyBox});

  @override
  Future<String> addMoodSurveys(MoodSurveyModel moodSurveyModel) async {
    await moodSurveyBox.put(moodSurveyModel.date, moodSurveyModel);
    return 'Ok';
  }

  @override
  List<MoodSurveyModel> getMoodSurveys() => moodSurveyBox.values.toList();
}
