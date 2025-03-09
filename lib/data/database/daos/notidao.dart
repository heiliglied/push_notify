import 'package:drift/drift.dart';
import 'package:push_notify/data/database/database.dart';
import 'package:push_notify/data/database/migrations/notification.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notidao.g.dart';

@DriftAccessor(tables: [Notification])
class NotificationDao extends DatabaseAccessor<Database> with _$NotificationDaoMixin{
  NotificationDao(Database db): super(db);

  Future<int> insertNoti(NotificationCompanion notiCompanion) => into(notification).insert(notiCompanion);

  Stream<List<NotificationData>>? getNotNotifiedNotiPaginationStream(int page, int limit) {
    final query = (select(notification)
      ..where((t) => t.status.equals(true) & t.date.isBiggerThanValue(DateTime.now()))
      ..limit(limit, offset: page * limit)
      ..orderBy([(t) => OrderingTerm(expression: t.date, mode: OrderingMode.asc)]));

    return query.watch();
  }

  Future<List<NotificationData>>? getNotificationList(int page, int limit) {
    final query = (select(notification)
      ..where((t) => t.status.equals(true) & t.date.isBiggerThanValue(DateTime.now()))
      ..limit(limit, offset: page * limit)
      ..orderBy([(t) => OrderingTerm(expression: t.date, mode: OrderingMode.asc)]));

    return query.get();
  }

  Future<NotificationData?> getNotification(int id) {
    final query = (select(notification)
      ..where((t) => t.id.equals(id))..limit(1));

    return query.getSingleOrNull();
  }

  Future<int> updateNoti(int id, NotificationCompanion notiCompanion) => (update(notification) ..where((t) => t.id.equals(id))).write(notiCompanion);
}

final notiDaoProvider = Provider<NotificationDao>((ref) {
  final notificationProvider = ref.watch(databaseProvider);
  return NotificationDao(notificationProvider);
});