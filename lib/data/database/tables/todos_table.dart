import 'package:drift/drift.dart';
import 'package:todo_list_app/data/database/tables/categories_table.dart';

class TodosTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text().withLength(min: 1, max: 200)();
  TextColumn get description => text().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  IntColumn get priority => integer().withDefault(const Constant(0))();
  DateTimeColumn get dueDate => dateTime().nullable()();
  TextColumn get categoryId =>
      text().nullable().references(CategoriesTable, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
