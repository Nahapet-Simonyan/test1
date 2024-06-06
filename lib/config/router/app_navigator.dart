import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  AppNavigator(this.context);

  final BuildContext context;

  static void goCalendarPage({required BuildContext context}) {
    context.go(context.namedLocation('calendarPage'));
  }

  static void goMoodSurveyPage({required BuildContext context}) {
    context.go(context.namedLocation('moodSurveyPage'));
  }
}
