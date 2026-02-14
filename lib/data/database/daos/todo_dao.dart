import 'package:drift/drift.dart';
import 'package:todo_list_app/data/database/app_database.dart';
import 'package:todo_list_app/data/database/tables/todos_table.dart';

part 'todo_dao.g.dart';

@DriftAccessor(tables: [TodosTable])
class TodoDao extends DatabaseAccessor<AppDatabase> with _$TodoDaoMixin {
  TodoDao(super.db);

  Future<List<TodosTableData>> getAll() => select(todosTable).get();

  Stream<List<TodosTableData>> watchAll() => select(todosTable).watch();

  Future<TodosTableData?> getById(String id) =>
      (select(todosTable)..where((t) => t.id.equals(id))).getSingleOrNull();

  Stream<TodosTableData?> watchById(String id) =>
      (select(todosTable)..where((t) => t.id.equals(id)))
          .watchSingleOrNull();

  Future<List<TodosTableData>> getByCategory(String categoryId) =>
      (select(todosTable)..where((t) => t.categoryId.equals(categoryId))).get();

  Future<List<TodosTableData>> getCompleted() =>
      (select(todosTable)..where((t) => t.isCompleted.equals(true))).get();

  Future<List<TodosTableData>> getPending() =>
      (select(todosTable)..where((t) => t.isCompleted.equals(false))).get();

  Future<List<TodosTableData>> getByPriority(int priority) =>
      (select(todosTable)..where((t) => t.priority.equals(priority))).get();

  Future<List<TodosTableData>> getDueToday() {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(todosTable)
          ..where((t) =>
              t.dueDate.isBiggerOrEqualValue(startOfDay) &
              t.dueDate.isSmallerThanValue(endOfDay)))
        .get();
  }

  Future<List<TodosTableData>> getOverdue() {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);

    return (select(todosTable)
          ..where((t) =>
              t.dueDate.isSmallerThanValue(startOfDay) &
              t.isCompleted.equals(false)))
        .get();
  }

  Future<List<TodosTableData>> getUpcoming() {
    final now = DateTime.now();
    final endOfDay = DateTime(now.year, now.month, now.day)
        .add(const Duration(days: 1));

    return (select(todosTable)
          ..where((t) =>
              t.dueDate.isBiggerOrEqualValue(endOfDay) &
              t.isCompleted.equals(false)))
        .get();
  }

  Future<int> insertTodo(TodosTableCompanion todo) =>
      into(todosTable).insert(todo);

  Future<bool> updateTodo(TodosTableCompanion todo) =>
      update(todosTable).replace(todo);

  Future<int> deleteTodo(String id) =>
      (delete(todosTable)..where((t) => t.id.equals(id))).go();

  Future<int> deleteCompleted() =>
      (delete(todosTable)..where((t) => t.isCompleted.equals(true))).go();

  Future<void> toggleCompleted(String id) async {
    final todo = await getById(id);
    if (todo != null) {
      await (update(todosTable)..where((t) => t.id.equals(id))).write(
        TodosTableCompanion(
          isCompleted: Value(!todo.isCompleted),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }
  }
}
