import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:push_notify/data/database/database.dart';
import 'package:push_notify/data/database/daos/notidao.dart';

final notificationListProvider = StateNotifierProvider<NotificationNotifier, List<NotificationData>>((ref) {
  final notificationDao = ref.watch(notiDaoProvider);
  return NotificationNotifier(notificationDao);
});

class NotificationNotifier extends StateNotifier<List<NotificationData>> {
  NotificationNotifier(this._notificationDao) : super([]);

  final NotificationDao _notificationDao;

  Future<void> fetchNotifications(int page, int limit) async {
    _notificationDao.getNotNotifiedNotiPaginationStream(page, limit)?.listen((newNotifications) {
      state = newNotifications;
    });
  }
}