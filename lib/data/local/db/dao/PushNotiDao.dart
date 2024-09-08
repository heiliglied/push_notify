import 'package:drift/drift.dart';
import 'package:push_notify/data/local/db/entity/PushNoti.dart';
import '../Database.dart';

part 'PushNotiDao.g.dart';

@DriftAccessor(tables: [PushNoti])
class PushNotiDao extends DatabaseAccessor<AppDb> with _$PushNotiDaoMixin {
  PushNotiDao(super.db);

  Future<int> addOrUpdateNoti(PushNotiCompanion notiCompanion) =>
      pushNoti.insertOnConflictUpdate(notiCompanion);

  Stream<List<PushNotiData>> getStreamNotNotifiedList(int page, int limit) {
    final offsetValue = limit * page;
    return (select(pushNoti)
      ..where((t) =>
        t.status.equals(false) &
        t.date.isBiggerThanValue(DateTime.now()))
      ..limit(
        limit,
        offset: offsetValue,
      )
      ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.asc)
      ]))
        .watch();
  }
}