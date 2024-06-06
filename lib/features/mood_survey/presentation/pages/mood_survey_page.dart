// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:test1/config/config.dart';
import 'package:test1/config/router/app_navigator.dart';
import 'tab_statistics.dart';
import 'tab_mood_diary.dart';
import '../widgets/widgets.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<DateTime> clock = Stream<DateTime>.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now(),
    );
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: StreamBuilder<DateTime>(
              stream: clock,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    DateFormat('dd MMMM hh:mm').format(snapshot.data!),
                    style: AppTextStyle.header3(fontWeight: FontWeight.w700),
                  );
                } else {
                  return Text(
                    DateFormat('dd MMMM hh:mm').format(DateTime.now()),
                    style: AppTextStyle.header3(fontWeight: FontWeight.w700),
                  );
                }
              },
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () => AppNavigator.goCalendarPage(context: context),
                icon: Image.asset('assets/icons/calendar.png'),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Container(
                  height: 30,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: AppColors.gray4,
                  ),
                  child: TabBar(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: const BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    labelColor: AppColors.white,
                    unselectedLabelColor: AppColors.gray2,
                    tabs: [
                      TabItem(
                        title: 'Дневник настроения',
                        icon: Image.asset('assets/icons/book.png'),
                      ),
                      TabItem(
                        title: 'Статистика',
                        icon: Image.asset('assets/icons/chart.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: const Padding(
            padding: EdgeInsets.all(20.0),
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                TabMoodDiary(),
                TabStatistics(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
