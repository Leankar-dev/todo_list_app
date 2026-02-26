import 'package:drift/drift.dart';
import 'package:todo_list_app/data/database/app_database.dart';
import 'package:todo_list_app/domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String passwordHash;
  final DateTime createdAt;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.passwordHash,
    required this.createdAt,
  });

  factory UserModel.fromDrift(UsersTableData data) => UserModel(
    id: data.id,
    name: data.name,
    email: data.email,
    passwordHash: data.passwordHash,
    createdAt: data.createdAt,
  );

  factory UserModel.fromEntity(UserEntity entity, {String passwordHash = ''}) =>
      UserModel(
        id: entity.id,
        name: entity.name,
        email: entity.email,
        passwordHash: passwordHash,
        createdAt: entity.createdAt,
      );

  UserEntity toEntity() => UserEntity(
    id: id,
    name: name,
    email: email,
    createdAt: createdAt,
  );

  UsersTableCompanion toCompanion() => UsersTableCompanion(
    id: Value(id),
    name: Value(name),
    email: Value(email),
    passwordHash: Value(passwordHash),
    createdAt: Value(createdAt),
  );
}
