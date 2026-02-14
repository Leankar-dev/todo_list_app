import 'package:todo_list_app/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getAll();
  Stream<List<TodoEntity>> watchAll();
  Future<TodoEntity?> getById(String id);
  Stream<TodoEntity?> watchById(String id);
  Future<List<TodoEntity>> getByCategory(String categoryId);
  Future<List<TodoEntity>> getCompleted();
  Future<List<TodoEntity>> getPending();
  Future<List<TodoEntity>> getByPriority(int priority);
  Future<List<TodoEntity>> getDueToday();
  Future<List<TodoEntity>> getOverdue();
  Future<List<TodoEntity>> getUpcoming();
  Future<void> insert(TodoEntity todo);
  Future<void> update(TodoEntity todo);
  Future<void> delete(String id);
  Future<void> deleteCompleted();
  Future<void> toggleCompleted(String id);
}
