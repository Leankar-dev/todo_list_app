import 'package:flutter/material.dart';
import 'package:todo_list_app/core/constants/app_colors.dart';

enum TodoStatus {
  pending(0),
  inProgress(1),
  completed(2);

  final int value;
  const TodoStatus(this.value);

  String get label => switch (this) {
        TodoStatus.pending => 'Pendente',
        TodoStatus.inProgress => 'Em Progresso',
        TodoStatus.completed => 'Concluida',
      };

  Color get color => switch (this) {
        TodoStatus.pending => AppColors.warning,
        TodoStatus.inProgress => AppColors.info,
        TodoStatus.completed => AppColors.success,
      };

  IconData get icon => switch (this) {
        TodoStatus.pending => Icons.pending_outlined,
        TodoStatus.inProgress => Icons.timelapse,
        TodoStatus.completed => Icons.check_circle_outline,
      };

  static TodoStatus fromValue(int value) => switch (value) {
        0 => TodoStatus.pending,
        1 => TodoStatus.inProgress,
        2 => TodoStatus.completed,
        _ => TodoStatus.pending,
      };
}
