// Flutter import:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:test1/config/config.dart';
import 'package:test1/core/enums/enums.dart';
import 'package:test1/core/constants/mood_subtypes.dart';
import '../cubit/mood_cubit.dart';
import '../widgets/widgets.dart';

class TabMoodDiary extends StatelessWidget {
  const TabMoodDiary({super.key});

  bool validState(MoodState state) {
    return state.moodType != null &&
        state.moodSubtype != null &&
        state.notes != null &&
        state.notes!.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<MoodCubit, MoodState>(
        bloc: GetIt.I<MoodCubit>(),
        builder: (context, state) {
          final cubit = GetIt.I<MoodCubit>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).whatDoYouFeel, style: AppTextStyle.header4()),
              SizedBox(
                height: 138,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (c, i) => const SizedBox(width: 10),
                  itemCount: MoodType.values.length,
                  itemBuilder: (context, index) => MoodIconCard(
                    moodType: MoodType.values[index],
                    onTap: () => cubit.changeMoodType(MoodType.values[index]),
                    enableBorder: state.moodType == MoodType.values[index],
                  ),
                ),
              ),
              if (state.moodType != null)
                Wrap(
                  children: List.generate(
                    MoodSubtypes.getList(state.moodType!).length,
                    (index) {
                      final item = MoodSubtypes.getList(state.moodType!)[index];
                      return MoodRectCard(
                        title: item,
                        onTap: () => cubit.changeMoodSubType(item),
                        isTaped: state.moodSubtype == item,
                      );
                    },
                  ),
                ),
              const SizedBox(height: 20),
              Text(S.of(context).stressLevel, style: AppTextStyle.header4()),
              const SizedBox(height: 10),
              CustomSlider(
                currentSliderValue: state.stressLevel,
                onChanged: cubit.state.moodType == null ||
                        cubit.state.moodSubtype == null
                    ? null
                    : (value) => cubit.changeStressLevel(value),
              ),
              const SizedBox(height: 20),
              Text(S.of(context).selfRespect, style: AppTextStyle.header4()),
              const SizedBox(height: 10),
              CustomSlider(
                currentSliderValue: state.selfRating,
                onChanged: cubit.state.moodType == null ||
                        cubit.state.moodSubtype == null
                    ? null
                    : (value) => cubit.changeSelfRespect(value),
              ),
              const SizedBox(height: 20),
              Text(S.of(context).notes, style: AppTextStyle.header4()),
              const SizedBox(height: 10),
              Container(
                constraints: const BoxConstraints(
                  minHeight: 90,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 11,
                      color: AppColors.gray2.withOpacity(0.11),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (note) => cubit.changeNotes(note),
                  maxLines: null,
                  cursorColor: AppColors.orange,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    border: InputBorder.none,
                    hintText: S.of(context).moodSurveyNoteHintText,
                    hintStyle: AppTextStyle.body3(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  cubit.saveMoodSurvey();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Анкета добавлено!',
                        style: AppTextStyle.header3(),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color:
                        validState(state) ? AppColors.orange : AppColors.gray4,
                    borderRadius: BorderRadius.circular(69),
                  ),
                  child: Center(
                    child: Text(
                      S.of(context).save,
                      style: AppTextStyle.body1(
                        color: validState(state)
                            ? AppColors.white
                            : AppColors.gray2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
