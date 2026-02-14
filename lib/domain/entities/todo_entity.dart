import 'package:equatable/equatable.dart';
import 'package:todo_list_app/domain/enums/todo_priority.dart';

class TodoEntity extends Equatable {
  final String id;
  final String title;
  final String? description;
  final bool isCompleted;
  final TodoPriority priority;
  final DateTime? dueDate;
  final String? categoryId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TodoEntity({
    required this.id,
    required this.title,
    this.description,
    this.isCompleted = false,
    this.priority = TodoPriority.low,
    this.dueDate,
    this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  TodoEntity copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    TodoPriority? priority,
    DateTime? dueDate,
    String? categoryId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TodoEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      priority: priority ?? this.priority,
      dueDate: dueDate ?? this.dueDate,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  bool get isOverdue {
    if (isCompleted) return false;
    if (dueDate case final due?) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final dueDateOnly = DateTime(due.year, due.month, due.day);
      return dueDateOnly.isBefore(today);
    }
    return false;
  }

  bool get isDueToday {
    if (dueDate case final due?) {
      final now = DateTime.now();
      return due.year == now.year &&
          due.month == now.month &&
          due.day == now.day;
    }
    return false;
  }

  bool get isUpcoming {
    if (isCompleted) return false;
    if (dueDate case final due?) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final dueDateOnly = DateTime(due.year, due.month, due.day);
      return dueDateOnly.isAfter(today);
    }
    return false;
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isCompleted,
        priority,
        dueDate,
        categoryId,
        createdAt,
        updatedAt,
      ];
}
