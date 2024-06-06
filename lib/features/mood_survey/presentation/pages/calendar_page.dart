// Flutter import:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:test1/config/config.dart';
import 'package:test1/features/mood_survey/presentation/cubit/mood_cubit.dart';
import '../widgets/build_month.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  static const List<String> _weekDays = [
    'ПН',
    'ВТ',
    'СР',
    'ЧТ',
    'ПТ',
    'СБ',
    'ВС',
  ];

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  double _scale = 2;
  double _previousScale = 1.0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedDay();
    });
  }

  void changeCalendarStyle() async {
    setState(() {
      _scale = 2;
      _previousScale = 1.0;
    });
  }

  void _scrollToSelectedDay() async {
    const monthHeight = 385.0;
    final monthIndex = DateTime.now().month - 1;

    _scrollController.animateTo(
      monthIndex * monthHeight,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.close, color: AppColors.gray3),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              if(_scale < 1.5) {
                changeCalendarStyle();
                await Future.delayed(const Duration(seconds: 1));
              }
              _scrollToSelectedDay();
            },
            child: Text(S.of(context).today, style: AppTextStyle.header3()),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: BlocBuilder<MoodCubit, MoodState>(
        bloc: GetIt.I<MoodCubit>(),
        builder: (context, state) {
          return GestureDetector(
            onScaleStart: (ScaleStartDetails details) {
              _previousScale = _scale;
            },
            onScaleUpdate: (ScaleUpdateDetails details) {
              setState(() {
                _scale = _previousScale * details.scale;
              });
            },
            onScaleEnd: (ScaleEndDetails details) {
              setState(() {
                _previousScale = 1.0;
              });
            },
            child: _scale < 1.5
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0).copyWith(top: 0),
                        child: Text(
                          currentYear.toString(),
                          style: AppTextStyle.header1(),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.all(20.0).copyWith(top: 0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 30.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: 12,
                          itemBuilder: (context, index) {
                            return BuildMonth(
                              yearMode: true,
                              selectedDate: DateTime.now(),
                              currentYear: currentYear,
                              index: index,
                              monthStyle: AppTextStyle.header5(),
                              dayStyle: AppTextStyle.body5(),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GridView.builder(
                        padding: const EdgeInsets.all(20.0).copyWith(top: 0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                        ),
                        itemCount: CalendarPage._weekDays.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Text(
                              CalendarPage._weekDays[index],
                              style: AppTextStyle.label4(),
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(20.0).copyWith(top: 0),
                          itemCount: 12,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 390,
                              child: BuildMonth(
                                yearMode: false,
                                selectedDate:
                                    state.selectedDate ?? DateTime.now(),
                                currentYear: currentYear,
                                index: index,
                                monthStyle: AppTextStyle.header2(),
                                dayStyle: AppTextStyle.label2(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
