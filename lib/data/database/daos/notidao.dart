import 'package:drift/drift.dart';
import 'package:push_notify/data/database/database.dart';
import 'package:push_notify/data/database/migrations/notification.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notidao.g.dart';

@DriftAccessor(tables: [Notification])
class NotificationDao extends DatabaseAccessor<Database> with _$NotificationDaoMixin{
  NotificationDao(Database db): super(db);

  @riverpod
  Future<int> insertNoti(NotificationCompanion notiCompanion) => into(notification).insert(notiCompanion);
}
