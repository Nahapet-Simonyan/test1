import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,

  scaffoldBackgroundColor: AppColors.backGround,

  appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent)
);