// Package imports:
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:test1/core/constants/storage.dart';
import 'package:test1/core/enums/enums.dart';
import 'package:test1/features/mood_survey/mood_survey.dart';

Future<void> initializeDependencies() async {
  /// Hive
  await Hive.initFlutter();

  Hive.registerAdapter(MoodTypeAdapter());
  Hive.registerAdapter(MoodSurveyModelAdapter());

  final moodSurveyBox = await Hive.openBox<MoodSurveyModel>(
    AppStorage.moodSurveyBox,
  );

  /// Repositories
  GetIt.I.registerSingleton<IMoodSurveyRepository>(
    MoodSurveyRepository(moodSurveyBox: moodSurveyBox),
  );

  /// Blocs
  GetIt.I.registerSingleton<MoodCubit>(
    MoodCubit(GetIt.I<IMoodSurveyRepository>()),
  );
}
