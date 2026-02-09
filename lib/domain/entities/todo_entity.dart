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
    if (dueDate == null || isCompleted) return false;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dueDateOnly = DateTime(dueDate!.year, dueDate!.month, dueDate!.day);
    return dueDateOnly.isBefore(today);
  }

  bool get isDueToday {
    if (dueDate == null) return false;
    final now = DateTime.now();
    return dueDate!.year == now.year &&
        dueDate!.month == now.month &&
        dueDate!.day == now.day;
  }

  bool get isUpcoming {
    if (dueDate == null || isCompleted) return false;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dueDateOnly = DateTime(dueDate!.year, dueDate!.month, dueDate!.day);
    return dueDateOnly.isAfter(today);
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
