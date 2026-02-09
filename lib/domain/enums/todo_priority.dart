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

  String get label {
    switch (this) {
      case TodoPriority.low:
        return AppStrings.priorityLow;
      case TodoPriority.medium:
        return AppStrings.priorityMedium;
      case TodoPriority.high:
        return AppStrings.priorityHigh;
      case TodoPriority.urgent:
        return AppStrings.priorityUrgent;
    }
  }

  Color get color {
    switch (this) {
      case TodoPriority.low:
        return AppColors.priorityLow;
      case TodoPriority.medium:
        return AppColors.priorityMedium;
      case TodoPriority.high:
        return AppColors.priorityHigh;
      case TodoPriority.urgent:
        return AppColors.priorityUrgent;
    }
  }

  IconData get icon {
    switch (this) {
      case TodoPriority.low:
        return Icons.arrow_downward;
      case TodoPriority.medium:
        return Icons.remove;
      case TodoPriority.high:
        return Icons.arrow_upward;
      case TodoPriority.urgent:
        return Icons.priority_high;
    }
  }

  static TodoPriority fromValue(int value) {
    return TodoPriority.values.firstWhere(
      (e) => e.value == value,
      orElse: () => TodoPriority.low,
    );
  }
}
