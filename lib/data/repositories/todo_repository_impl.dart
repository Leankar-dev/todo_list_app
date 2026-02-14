import 'package:todo_list_app/data/database/daos/todo_dao.dart';
import 'package:todo_list_app/data/models/todo_model.dart';
import 'package:todo_list_app/data/repositories/todo_repository.dart';
import 'package:todo_list_app/domain/entities/todo_entity.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDao _todoDao;

  const TodoRepositoryImpl(this._todoDao);

  @override
  Future<List<TodoEntity>> getAll() async {
    final results = await _todoDao.getAll();
    return results.map((data) => TodoModel.fromDrift(data).toEntity()).toList();
  }

  @override
  Stream<List<TodoEntity>> watchAll() => _todoDao.watchAll().map(
        (list) =>
            list.map((data) => TodoModel.fromDrift(data).toEntity()).toList(),
      );

  @override
  Future<TodoEntity?> getById(String id) async {
    final data = await _todoDao.getById(id);
    if (data == null) return null;
    return TodoModel.fromDrift(data).toEntity();
  }

  @override
  Stream<TodoEntity?> watchById(String id) => _todoDao.watchById(id).map(
        (data) => data != null ? TodoModel.fromDrift(data).toEntity() : null,
      );

  @override
  Future<List<TodoEntity>> getByCategory(String categoryId) async {
    final results = await _todoDao.getByCategory(categoryId);
    return results.map((data) => TodoModel.fromDrift(data).toEntity()).toList();
  }

  @override
  Future<List<TodoEntity>> getCompleted() async {
    final results = await _todoDao.getCompleted();
    return results.map((data) => TodoModel.fromDrift(data).toEntity()).toList();
  }

  @override
  Future<List<TodoEntity>> getPending() async {
    final results = await _todoDao.getPending();
    return results.map((data) => TodoModel.fromDrift(data).toEntity()).toList();
  }

  @override
  Future<List<TodoEntity>> getByPriority(int priority) async {
    final results = await _todoDao.getByPriority(priority);
    return results.map((data) => TodoModel.fromDrift(data).toEntity()).toList();
  }

  @override
  Future<List<TodoEntity>> getDueToday() async {
    final results = await _todoDao.getDueToday();
    return results.map((data) => TodoModel.fromDrift(data).toEntity()).toList();
  }

  @override
  Future<List<TodoEntity>> getOverdue() async {
    final results = await _todoDao.getOverdue();
    return results.map((data) => TodoModel.fromDrift(data).toEntity()).toList();
  }

  @override
  Future<List<TodoEntity>> getUpcoming() async {
    final results = await _todoDao.getUpcoming();
    return results.map((data) => TodoModel.fromDrift(data).toEntity()).toList();
  }

  @override
  Future<void> insert(TodoEntity todo) async {
    final model = TodoModel.fromEntity(todo);
    await _todoDao.insertTodo(model.toCompanion());
  }

  @override
  Future<void> update(TodoEntity todo) async {
    final model = TodoModel.fromEntity(todo);
    await _todoDao.updateTodo(model.toCompanion());
  }

  @override
  Future<void> delete(String id) => _todoDao.deleteTodo(id);

  @override
  Future<void> deleteCompleted() => _todoDao.deleteCompleted();

  @override
  Future<void> toggleCompleted(String id) => _todoDao.toggleCompleted(id);
}
