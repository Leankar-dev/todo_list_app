import 'package:flutter/material.dart';
import 'package:todo_list_app/core/constants/app_colors.dart';

enum TodoStatus {
  pending(0),
  inProgress(1),
  completed(2);

  final int value;
  const TodoStatus(this.value);

  String get label {
    switch (this) {
      case TodoStatus.pending:
        return 'Pendente';
      case TodoStatus.inProgress:
        return 'Em Progresso';
      case TodoStatus.completed:
        return 'Concluida';
    }
  }

  Color get color {
    switch (this) {
      case TodoStatus.pending:
        return AppColors.warning;
      case TodoStatus.inProgress:
        return AppColors.info;
      case TodoStatus.completed:
        return AppColors.success;
    }
  }

  IconData get icon {
    switch (this) {
      case TodoStatus.pending:
        return Icons.pending_outlined;
      case TodoStatus.inProgress:
        return Icons.timelapse;
      case TodoStatus.completed:
        return Icons.check_circle_outline;
    }
  }

  static TodoStatus fromValue(int value) {
    return TodoStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => TodoStatus.pending,
    );
  }
}
