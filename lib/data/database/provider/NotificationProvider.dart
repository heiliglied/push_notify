import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:push_notify/data/database/repository/NotificationRepository.dart';
import 'package:push_notify/data/database/daos/NotificationDao.dart';

final notificationProvider = Provider<NotificationRepository>((ref) {
  final dao = ref.watch(notiDaoProvider);
  return NotificationRepository(dao);
});
