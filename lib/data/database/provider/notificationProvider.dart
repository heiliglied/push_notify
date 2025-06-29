import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:push_notify/data/database/repository/notificationRepository.dart';
import 'package:push_notify/data/database/daos/NotificationDao.dart';

final notificationProvider = Provider<Notificationrepository>((ref) {
  final dao = ref.watch(notiDaoProvider);
  return Notificationrepository(dao);
});
