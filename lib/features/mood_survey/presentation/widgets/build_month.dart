import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test1/config/config.dart';

import '../cubit/mood_cubit.dart';

class BuildMonth extends StatelessWidget {
  const BuildMonth({
    super.key,
    required this.yearMode,
    required this.selectedDate,
    required this.currentYear,
    required this.index,
    required this.monthStyle,
    required this.dayStyle,
  });

  final bool yearMode;
  final DateTime selectedDate;
  final int currentYear;
  final int index;
  final TextStyle monthStyle;
  final TextStyle dayStyle;

  static const List<String> _months = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь',
  ];

  int _getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      return (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) ? 29 : 28;
    }
    return [31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month - 1];
  }

  int _getFirstDayOfMonth(int year, int month) {
    return DateTime(year, month, 1).weekday;
  }

  @override
  Widget build(BuildContext context) {
    final monthName = _months[index];
    final daysInMonth = _getDaysInMonth(currentYear, index + 1);
    final firstDayOfMonth = _getFirstDayOfMonth(currentYear, index + 1);
    bool emptyWeek = firstDayOfMonth >= 7;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!yearMode)
          Text(
            currentYear.toString(),
            style: AppTextStyle.label3(),
          ),
        Text(monthName, style: monthStyle),
        const SizedBox(height: 10),
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemCount: emptyWeek ? daysInMonth : 42,
          itemBuilder: (context, dayIndex) {
            int dayNumber =
                emptyWeek ? dayIndex + 1 : dayIndex - (firstDayOfMonth - 1);
            bool isSelectedDay = selectedDate.year == currentYear &&
                selectedDate.month == index + 1 &&
                selectedDate.day == dayNumber;
            return dayNumber > 0 && dayNumber <= daysInMonth
                ? GestureDetector(
                    onTap: () => GetIt.I<MoodCubit>().changeSelectedDate(
                      DateTime(currentYear, index + 1, dayNumber),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelectedDay
                                ? AppColors.orange.withOpacity(0.25)
                                : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: Text('$dayNumber', style: dayStyle),
                        ),
                        if (DateTime(currentYear, index + 1, dayNumber) ==
                            DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                            ) && !yearMode)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 5,
                              width: 5,
                              margin: const EdgeInsets.only(bottom: 7),
                              decoration: BoxDecoration(
                                color: AppColors.orange,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          )
                      ],
                    ),
                  )
                : const SizedBox();
          },
        ),
      ],
    );
  }
}
