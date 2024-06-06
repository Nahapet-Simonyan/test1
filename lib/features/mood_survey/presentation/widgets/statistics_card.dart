// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:test1/config/config.dart';
import 'package:test1/core/enums/enums.dart';
import 'mood_card_widgets.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({
    super.key,
    required this.moodType,
    required this.date,
    required this.notes,
  });

  final MoodType moodType;
  final String date;
  final String notes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 90,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 11,
            color: AppColors.gray2.withOpacity(0.11),
          ),
        ],
      ),
      child: Row(
        children: [
          MoodIconCard(moodType: moodType, enableBorder: false),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat("yyyy-MM-dd | hh:mm").format(DateTime.parse(date)),
                  style: AppTextStyle.header5(),
                ),
                Flexible(child: Text(notes, style: AppTextStyle.body3())),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
