import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:push_notify/ui/notify/history/historyState.dart';
import 'package:push_notify/data/database/repository/notificationRepository.dart';

class HistoryNotifier extends StateNotifier<HistoryState>{
  final Notificationrepository notificationRepository;
  HistoryNotifier(this.notificationRepository) : super(const HistoryState(notifications: []));

  Future<void> fetchList() async {
    if (state.loading || state.allLoaded) return;
    state = state.copyWith(loading: true);
    final data = await notificationRepository.getAllNotification(
        state.page, state.limit, state.search, state.date);

    if (data == null || data.isEmpty) {
      state = state.copyWith(loading: false, allLoaded: true);
    } else {
      state = state.copyWith(
        loading: false,
        notifications: [...state.notifications, ...data],
        page: state.page + 1,
      );
    }
  }
}