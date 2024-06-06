// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:test1/config/config.dart';
import 'package:test1/core/enums/enums.dart';

class MoodIconCard extends StatelessWidget {
  const MoodIconCard({
    super.key,
    required this.moodType,
    this.onTap,
    required this.enableBorder,
  });

  final MoodType moodType;
  final void Function()? onTap;
  final bool enableBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 118,
        width: 83,
        decoration: BoxDecoration(
          color: Colors.white,
          border: enableBorder
              ? Border.all(color: AppColors.orange, width: 2)
              : null,
          borderRadius: BorderRadius.circular(76),
          boxShadow: [
            BoxShadow(
              blurRadius: 11,
              color: AppColors.gray2.withOpacity(0.11),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/mood_images/${moodType.name}.png'),
            Text(
              S.of(context).moodType(moodType.name),
              style: AppTextStyle.body4(),
            ),
          ],
        ),
      ),
    );
  }
}

class MoodRectCard extends StatelessWidget {
  const MoodRectCard({
    super.key,
    required this.title,
    required this.onTap,
    required this.isTaped,
  });

  final String title;
  final void Function()? onTap;
  final bool isTaped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 5, top: 5),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: isTaped ? AppColors.orange : AppColors.white,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
              blurRadius: 11,
              color: AppColors.gray2.withOpacity(0.11),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyle.body4(
                color: isTaped ? AppColors.white : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
