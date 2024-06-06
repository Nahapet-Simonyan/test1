import '../../data/models/mood_survey_model.dart';

abstract interface class IMoodSurveyRepository {
  Future<String> addMoodSurveys(MoodSurveyModel moodSurveyModel);
  List<MoodSurveyModel> getMoodSurveys();
}
