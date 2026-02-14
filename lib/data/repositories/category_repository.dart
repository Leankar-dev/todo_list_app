import 'package:todo_list_app/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getAll();
  Stream<List<CategoryEntity>> watchAll();
  Future<CategoryEntity?> getById(String id);
  Future<void> insert(CategoryEntity category);
  Future<void> update(CategoryEntity category);
  Future<void> delete(String id);
}
