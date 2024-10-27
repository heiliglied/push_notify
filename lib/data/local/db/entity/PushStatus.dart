import 'package:drift/drift.dart';
import 'PushNoti.dart';

@DataClassName("NotiStatus")
class PushStatus extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pushNotiId => integer().references(PushNoti, #id)(); // Foreign key
  BoolColumn get status => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}
