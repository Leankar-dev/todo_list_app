import 'package:drift/drift.dart';

class CategoriesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  IntColumn get color => integer()();
  TextColumn get icon => text()();

  @override
  Set<Column> get primaryKey => {id};
}
