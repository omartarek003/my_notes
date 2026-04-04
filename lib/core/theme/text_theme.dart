import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

TextTheme lightTextTheme = GoogleFonts.interTextTheme().copyWith(
  // Headers
  headlineLarge: const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: AppColors.lightTextPrimary,
  ),
  // Titles
  titleLarge: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppColors.lightTextPrimary,
  ),

  titleMedium: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.lightTextPrimary,
  ),

  // Body
  bodyLarge: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.lightTextPrimary,
  ),

  bodyMedium: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.lightTextPrimary,
  ),
  bodySmall: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.lightTextPrimary,
  ),

  // Small text
  labelMedium: const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.lightTextPrimary,
  ),

  labelSmall: const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.lightTextPrimary,
  ),
);

TextTheme darkTextTheme =
    GoogleFonts.interTextTheme(
      ThemeData.dark().textTheme,
    ).copyWith(
      headlineLarge: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w800,
        color: AppColors.darkTextPrimary,
      ),

      titleLarge: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: AppColors.darkTextPrimary,
      ),
      titleMedium: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.darkTextPrimary,
      ),

      bodyLarge: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
      ),
      bodyMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.darkTextPrimary,
      ),

      bodySmall: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.darkTextPrimary,
      ),

      labelMedium: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.darkTextPrimary,
      ),

      labelSmall: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: AppColors.darkTextPrimary,
      ),
    );
