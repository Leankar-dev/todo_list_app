import 'package:flutter/material.dart';
import 'package:todo_list_app/core/constants/app_strings.dart';

enum FilterType {
  all,
  today,
  upcoming,
  completed,
  pending;

  String get label => switch (this) {
        FilterType.all => AppStrings.all,
        FilterType.today => AppStrings.today,
        FilterType.upcoming => AppStrings.upcoming,
        FilterType.completed => AppStrings.completed,
        FilterType.pending => AppStrings.pending,
      };

  IconData get icon => switch (this) {
        FilterType.all => Icons.list,
        FilterType.today => Icons.today,
        FilterType.upcoming => Icons.upcoming,
        FilterType.completed => Icons.check_circle,
        FilterType.pending => Icons.pending,
      };
}
