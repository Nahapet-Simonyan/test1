import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/core/enums/enums.dart';
import 'package:test1/features/mood_survey/data/models/mood_survey_model.dart';
import 'package:test1/features/mood_survey/domain/repositories/i_mood_survey_repository.dart';

part 'mood_state.dart';

class MoodCubit extends Cubit<MoodState> {
  MoodCubit(this._repository) : super(const MoodState());

  final IMoodSurveyRepository _repository;

  changeMoodType(MoodType moodType) {
    emit(state.copyWith(moodType: moodType, moodSubtype: null));
  }

  changeMoodSubType(String moodSubtype) {
    emit(state.copyWith(moodSubtype: moodSubtype));
  }

  changeStressLevel(double stressLevel) {
    emit(state.copyWith(
      stressLevel: stressLevel,
      moodSubtype: state.moodSubtype,
    ));
  }

  changeSelfRespect(double selfRespect) {
    emit(state.copyWith(
      selfRating: selfRespect,
      moodSubtype: state.moodSubtype,
    ));
  }

  changeNotes(String note) {
    emit(state.copyWith(
      notes: note,
      moodSubtype: state.moodSubtype,
    ));
  }

  changeSelectedDate(DateTime date) {
    emit(state.copyWith(
      selectedDate: date,
      moodSubtype: state.moodSubtype,
    ));
  }

  saveMoodSurvey() {
    _repository.addMoodSurveys(
      MoodSurveyModel(
        moodType: state.moodType!,
        stressLevel: state.stressLevel,
        selfRating: state.selfRating,
        notes: state.notes!,
        date: DateTime.now().toString(),
      ),
    );
  }

  getMoodSurveys() {
    emit(state.copyWith(surveysList: _repository.getMoodSurveys()));
  }
}
