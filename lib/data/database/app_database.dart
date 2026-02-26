import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:todo_list_app/data/database/daos/category_dao.dart';
import 'package:todo_list_app/data/database/daos/todo_dao.dart';
import 'package:todo_list_app/data/database/daos/user_dao.dart';
import 'package:todo_list_app/data/database/tables/categories_table.dart';
import 'package:todo_list_app/data/database/tables/todos_table.dart';
import 'package:todo_list_app/data/database/tables/users_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [TodosTable, CategoriesTable, UsersTable],
  daos: [TodoDao, CategoryDao, UserDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Futuras migracoes aqui
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'todo_list.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
