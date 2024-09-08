import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'dao/PushNotiDao.dart';
import 'entity/PushNoti.dart';

part 'Database.g.dart';

@DriftDatabase(
  tables: [PushNoti],
  daos: [PushNotiDao],
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration =>
      MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // 기존 파일 삭제 (개발 중에만 사용)
    // if (await file.exists()) {
    //   await file.delete();
    // }

    return NativeDatabase(file);
  });
}
