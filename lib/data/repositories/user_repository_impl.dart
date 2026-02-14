import 'package:todo_list_app/data/database/daos/user_dao.dart';
import 'package:todo_list_app/data/models/user_model.dart';
import 'package:todo_list_app/data/repositories/user_repository.dart';
import 'package:todo_list_app/domain/entities/user_entity.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDao _userDao;

  const UserRepositoryImpl(this._userDao);

  @override
  Future<List<UserEntity>> getAll() async {
    final results = await _userDao.getAll();
    return results
        .map((data) => UserModel.fromDrift(data).toEntity())
        .toList();
  }

  @override
  Future<UserEntity?> getById(String id) async {
    final data = await _userDao.getById(id);
    if (data == null) return null;
    return UserModel.fromDrift(data).toEntity();
  }

  @override
  Future<UserEntity?> getByEmail(String email) async {
    final data = await _userDao.getByEmail(email);
    if (data == null) return null;
    return UserModel.fromDrift(data).toEntity();
  }

  @override
  Future<void> insert(UserEntity user, String passwordHash) async {
    final model = UserModel.fromEntity(user, passwordHash: passwordHash);
    await _userDao.insertUser(model.toCompanion());
  }

  @override
  Future<void> update(UserEntity user, String passwordHash) async {
    final model = UserModel.fromEntity(user, passwordHash: passwordHash);
    await _userDao.updateUser(model.toCompanion());
  }

  @override
  Future<void> delete(String id) => _userDao.deleteUser(id);

  @override
  Future<bool> verifyPassword(String email, String passwordHash) async {
    final data = await _userDao.getByEmail(email);
    if (data == null) return false;
    return data.passwordHash == passwordHash;
  }
}
