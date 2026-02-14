import 'package:drift/drift.dart';
import 'package:todo_list_app/data/database/app_database.dart';
import 'package:todo_list_app/domain/entities/todo_entity.dart';
import 'package:todo_list_app/domain/enums/todo_priority.dart';

class TodoModel {
  final String id;
  final String title;
  final String? description;
  final bool isCompleted;
  final int priority;
  final DateTime? dueDate;
  final String? categoryId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TodoModel({
    required this.id,
    required this.title,
    this.description,
    this.isCompleted = false,
    this.priority = 0,
    this.dueDate,
    this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TodoModel.fromDrift(TodosTableData data) => TodoModel(
        id: data.id,
        title: data.title,
        description: data.description,
        isCompleted: data.isCompleted,
        priority: data.priority,
        dueDate: data.dueDate,
        categoryId: data.categoryId,
        createdAt: data.createdAt,
        updatedAt: data.updatedAt,
      );

  factory TodoModel.fromEntity(TodoEntity entity) => TodoModel(
        id: entity.id,
        title: entity.title,
        description: entity.description,
        isCompleted: entity.isCompleted,
        priority: entity.priority.value,
        dueDate: entity.dueDate,
        categoryId: entity.categoryId,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );

  TodoEntity toEntity() => TodoEntity(
        id: id,
        title: title,
        description: description,
        isCompleted: isCompleted,
        priority: TodoPriority.fromValue(priority),
        dueDate: dueDate,
        categoryId: categoryId,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  TodosTableCompanion toCompanion() => TodosTableCompanion(
        id: Value(id),
        title: Value(title),
        description: Value(description),
        isCompleted: Value(isCompleted),
        priority: Value(priority),
        dueDate: Value(dueDate),
        categoryId: Value(categoryId),
        createdAt: Value(createdAt),
        updatedAt: Value(updatedAt),
      );
}
