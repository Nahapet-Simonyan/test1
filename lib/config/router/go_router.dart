// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:test1/features/mood_survey/mood_survey.dart';

final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

final GoRouter goRouter = GoRouter(
  navigatorKey: _navigatorKey,
  routes: [
    GoRoute(
      path: '/',
      name: 'moodSurveyPage',
      pageBuilder: (context, state) {
        return const CupertinoPage(child: MoodScreen());
      },
      routes: [
        GoRoute(
          path: 'calendarPage',
          name: 'calendarPage',
          pageBuilder: (context, state) {
            return const CupertinoPage(child: CalendarPage());
          },
        ),
      ]
    ),
  ],
);
