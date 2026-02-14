import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/data/database/app_database.dart';
import 'package:todo_list_app/domain/entities/category_entity.dart';

class CategoryModel {
  final String id;
  final String name;
  final int color;
  final String icon;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.color,
    required this.icon,
  });

  factory CategoryModel.fromDrift(CategoriesTableData data) => CategoryModel(
        id: data.id,
        name: data.name,
        color: data.color,
        icon: data.icon,
      );

  factory CategoryModel.fromEntity(CategoryEntity entity) => CategoryModel(
        id: entity.id,
        name: entity.name,
        color: entity.color.toARGB32(),
        icon: entity.icon.codePoint.toString(),
      );

  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        name: name,
        color: Color(color),
        icon: IconData(int.parse(icon), fontFamily: 'MaterialIcons'),
      );

  CategoriesTableCompanion toCompanion() => CategoriesTableCompanion(
        id: Value(id),
        name: Value(name),
        color: Value(color),
        icon: Value(icon),
      );
}
