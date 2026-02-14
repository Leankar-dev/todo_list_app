import 'package:todo_list_app/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getAll();
  Future<UserEntity?> getById(String id);
  Future<UserEntity?> getByEmail(String email);
  Future<void> insert(UserEntity user, String passwordHash);
  Future<void> update(UserEntity user, String passwordHash);
  Future<void> delete(String id);
  Future<bool> verifyPassword(String email, String passwordHash);
}
