import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final DateTime createdAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
  });

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    DateTime? createdAt,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  String get initials => switch (name.trim().split(' ')) {
        [final first, ..., final last] =>
          '${first[0]}${last[0]}'.toUpperCase(),
        [final single] when single.isNotEmpty => single[0].toUpperCase(),
        _ => '?',
      };

  @override
  List<Object?> get props => [id, name, email, createdAt];
}
