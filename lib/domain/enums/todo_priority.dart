import 'package:flutter/material.dart';
import 'package:todo_list_app/core/constants/app_colors.dart';
import 'package:todo_list_app/core/constants/app_strings.dart';

enum TodoPriority {
  low(0),
  medium(1),
  high(2),
  urgent(3);

  final int value;
  const TodoPriority(this.value);

  String get label => switch (this) {
        TodoPriority.low => AppStrings.priorityLow,
        TodoPriority.medium => AppStrings.priorityMedium,
        TodoPriority.high => AppStrings.priorityHigh,
        TodoPriority.urgent => AppStrings.priorityUrgent,
      };

  Color get color => switch (this) {
        TodoPriority.low => AppColors.priorityLow,
        TodoPriority.medium => AppColors.priorityMedium,
        TodoPriority.high => AppColors.priorityHigh,
        TodoPriority.urgent => AppColors.priorityUrgent,
      };

  IconData get icon => switch (this) {
        TodoPriority.low => Icons.arrow_downward,
        TodoPriority.medium => Icons.remove,
        TodoPriority.high => Icons.arrow_upward,
        TodoPriority.urgent => Icons.priority_high,
      };

  static TodoPriority fromValue(int value) => switch (value) {
        0 => TodoPriority.low,
        1 => TodoPriority.medium,
        2 => TodoPriority.high,
        3 => TodoPriority.urgent,
        _ => TodoPriority.low,
      };
}
