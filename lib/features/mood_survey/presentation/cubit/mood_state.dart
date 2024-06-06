part of 'mood_cubit.dart';

class MoodState extends Equatable {
  final MoodType? moodType;
  final String? moodSubtype;
  final double stressLevel;
  final double selfRating;
  final String? notes;
  final DateTime? selectedDate;
  final List<MoodSurveyModel>? surveysList;

  const MoodState({
    this.moodType,
    this.moodSubtype,
    this.stressLevel = 50,
    this.selfRating = 50,
    this.notes,
    this.selectedDate,
    this.surveysList,
  });

  MoodState copyWith({
    MoodType? moodType,
    String? moodSubtype,
    double? stressLevel,
    double? selfRating,
    String? notes,
    DateTime? selectedDate,
    List<MoodSurveyModel>? surveysList,
  }) {
    return MoodState(
      moodType: moodType ?? this.moodType,
      moodSubtype: moodSubtype,
      stressLevel: stressLevel ?? this.stressLevel,
      selfRating: selfRating ?? this.selfRating,
      notes: notes ?? this.notes,
      selectedDate: selectedDate ?? this.selectedDate,
      surveysList: surveysList ?? this.surveysList,
    );
  }

  @override
  List<Object?> get props => [
        moodType,
        moodSubtype,
        stressLevel,
        selfRating,
        notes,
        selectedDate,
        surveysList,
      ];
}
