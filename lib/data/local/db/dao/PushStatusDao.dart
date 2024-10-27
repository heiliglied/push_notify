import 'package:drift/drift.dart';
import '../Database.dart';
import '../entity/PushStatus.dart';

part 'PushStatusDao.g.dart';

@DriftAccessor(tables: [PushStatus])
class PushStatusDao extends DatabaseAccessor<AppDb> with _$PushStatusDaoMixin {
  PushStatusDao(AppDb db) : super(db);

  Future<void> insertStatus(PushStatusCompanion status) {
    return into(pushStatus).insert(status);
  }

  Future<void> updateStatus(PushStatusCompanion status) {
    return update(pushStatus).replace(status);
  }

  Future<void> deleteStatus(PushStatusCompanion status) {
    return delete(pushStatus).delete(status);
  }
}