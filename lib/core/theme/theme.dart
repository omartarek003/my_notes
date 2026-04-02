import 'package:flutter/material.dart';
import 'package:notes_and_todos/core/theme/text_theme.dart';

import 'colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.lightPrimary,
  scaffoldBackgroundColor: AppColors.lightBackground,
  cardColor: AppColors.lightSurface,
  textTheme: lightTextTheme,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.darkPrimary,
  scaffoldBackgroundColor: AppColors.darkBackground,
  cardColor: AppColors.darkSurface,
  textTheme: darkTextTheme,
);