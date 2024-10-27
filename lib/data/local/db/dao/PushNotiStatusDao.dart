import 'package:drift/drift.dart';
import 'package:push_notify/data/local/db/entity/PushNoti.dart';
import 'package:push_notify/data/local/db/entity/PushStatus.dart';
import '../Database.dart';

part 'PushNotiStatusDao.g.dart';

@DriftAccessor(tables: [PushNoti, PushStatus])
class PushNotiStatusDao extends DatabaseAccessor<AppDb> with _$PushNotiStatusDaoMixin {
  PushNotiStatusDao(super.db);

  // pushNoti id에 해당하는 status 정보를 합쳐서 내보냄
  Stream<List<PushNotiWithStatus>> watchAllNotiWithStatus() {
    return (select(pushNoti)
      ..orderBy([
            (n) => OrderingTerm(expression: n.date, mode: OrderingMode.desc),
      ]))
        .join([
      leftOuterJoin(pushStatus, pushStatus.pushNotiId.equalsExp(pushNoti.id)),
    ])
        .watch()
        .map((rows) {
      return rows.map((row) {
        final noti = row.readTable(pushNoti);
        final status = row.readTableOrNull(pushStatus);
        return PushNotiWithStatus(
          id: noti.id,
          date: noti.date,
          title: noti.title,
          contents: noti.contents,
          status: status?.status ?? false,
        );
      }).toList();
    });
  }
}

class PushNotiWithStatus {
  final int id;
  final DateTime date;
  final String title;
  final String contents;
  final bool status;

  PushNotiWithStatus({
    required this.id,
    required this.date,
    required this.title,
    required this.contents,
    required this.status,
  });
}