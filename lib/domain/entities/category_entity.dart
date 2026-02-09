import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final Color color;
  final IconData icon;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.color,
    required this.icon,
  });

  CategoryEntity copyWith({
    String? id,
    String? name,
    Color? color,
    IconData? icon,
  }) {
    return CategoryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      icon: icon ?? this.icon,
    );
  }

  @override
  List<Object?> get props => [id, name, color, icon];
}
