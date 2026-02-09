import 'package:flutter/material.dart';
import 'package:todo_list_app/core/constants/app_colors.dart';
import 'package:todo_list_app/core/constants/app_dimensions.dart';

abstract class AppTextStyles {
  // Display
  static const TextStyle displayLarge = TextStyle(
    fontSize: AppDimensions.fontDisplay,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: AppDimensions.fontTitle,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Headline
  static const TextStyle headlineLarge = TextStyle(
    fontSize: AppDimensions.fontXXL,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: AppDimensions.fontXL,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: AppDimensions.fontLG,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Title
  static const TextStyle titleLarge = TextStyle(
    fontSize: AppDimensions.fontXL,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: AppDimensions.fontLG,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: AppDimensions.fontMD,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // Body
  static const TextStyle bodyLarge = TextStyle(
    fontSize: AppDimensions.fontLG,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: AppDimensions.fontMD,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: AppDimensions.fontSM,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // Label
  static const TextStyle labelLarge = TextStyle(
    fontSize: AppDimensions.fontMD,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: AppDimensions.fontSM,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: AppDimensions.fontXS,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  // Button
  static const TextStyle button = TextStyle(
    fontSize: AppDimensions.fontLG,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: AppDimensions.fontMD,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Link
  static const TextStyle link = TextStyle(
    fontSize: AppDimensions.fontMD,
    fontWeight: FontWeight.normal,
    color: AppColors.primary,
    decoration: TextDecoration.underline,
  );

  // Hint
  static const TextStyle hint = TextStyle(
    fontSize: AppDimensions.fontMD,
    fontWeight: FontWeight.normal,
    color: AppColors.textHint,
  );

  // Error
  static const TextStyle error = TextStyle(
    fontSize: AppDimensions.fontSM,
    fontWeight: FontWeight.normal,
    color: AppColors.error,
  );
}
