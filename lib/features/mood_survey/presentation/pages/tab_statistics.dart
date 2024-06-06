// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test1/config/config.dart';

// Project imports:
import '../cubit/mood_cubit.dart';
import '../widgets/statistics_card.dart';

class TabStatistics extends StatelessWidget {
  const TabStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodCubit, MoodState>(
      bloc: GetIt.I<MoodCubit>()..getMoodSurveys(),
      builder: (context, state) {
        final surveys = state.surveysList;
        return surveys != null && surveys.isNotEmpty
            ? ListView.builder(
                itemCount: surveys.length ?? 0,
                itemBuilder: (context, index) {
                  return StatisticsCard(
                    moodType: surveys[index].moodType,
                    date: surveys[index].date,
                    notes: surveys[index].notes,
                  );
                },
              )
            : Center(
                child: Text(
                  'Пока нет статистики ...',
                  style: AppTextStyle.header3(),
                ),
              );
      },
    );
  }
}
