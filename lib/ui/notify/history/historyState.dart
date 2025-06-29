import 'package:push_notify/data/database/database.dart';

class HistoryState {
  final int page;
  final int limit;
  final bool loading;
  final bool allLoaded;
  final String search;
  final List<NotificationData> notifications;
  final DateTime? date;

  const HistoryState({
    required this.notifications,
    this.page = 0,
    this.limit = 8,
    this.loading = false,
    this.allLoaded = false,
    this.search = "",
    this.date,
  });

  HistoryState copyWith({
    List<NotificationData>? notifications,
    int? page,
    int? limit,
    bool? loading,
    bool? allLoaded,
    String? search,
    DateTime? date,
  }) {
    return HistoryState(
      notifications: notifications ?? this.notifications,
      page: page ?? this.page,
      limit: limit ?? this.limit,
      loading: loading ?? this.loading,
      allLoaded: allLoaded ?? this.allLoaded,
      search: search ?? this.search,
      date: date ?? this.date,
    );
  }
}
