import 'package:flutter/material.dart';
import 'package:todo_list_app/core/constants/app_strings.dart';

enum FilterType {
  all,
  today,
  upcoming,
  completed,
  pending;

  String get label {
    switch (this) {
      case FilterType.all:
        return AppStrings.all;
      case FilterType.today:
        return AppStrings.today;
      case FilterType.upcoming:
        return AppStrings.upcoming;
      case FilterType.completed:
        return AppStrings.completed;
      case FilterType.pending:
        return AppStrings.pending;
    }
  }

  IconData get icon {
    switch (this) {
      case FilterType.all:
        return Icons.list;
      case FilterType.today:
        return Icons.today;
      case FilterType.upcoming:
        return Icons.upcoming;
      case FilterType.completed:
        return Icons.check_circle;
      case FilterType.pending:
        return Icons.pending;
    }
  }
}
