import 'package:drift/drift.dart';
import 'package:todo_list_app/data/database/app_database.dart';
import 'package:todo_list_app/data/database/tables/users_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [UsersTable])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<List<UsersTableData>> getAll() => select(usersTable).get();

  Future<UsersTableData?> getById(String id) =>
      (select(usersTable)..where((u) => u.id.equals(id))).getSingleOrNull();

  Future<UsersTableData?> getByEmail(String email) =>
      (select(usersTable)..where((u) => u.email.equals(email)))
          .getSingleOrNull();

  Future<int> insertUser(UsersTableCompanion user) =>
      into(usersTable).insert(user);

  Future<bool> updateUser(UsersTableCompanion user) =>
      update(usersTable).replace(user);

  Future<int> deleteUser(String id) =>
      (delete(usersTable)..where((u) => u.id.equals(id))).go();
}
