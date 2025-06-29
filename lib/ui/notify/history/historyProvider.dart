import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:push_notify/data/database/provider/notificationProvider.dart';
import 'package:push_notify/ui/notify/history/historyNotifier.dart';
import 'package:push_notify/ui/notify/history/historyState.dart';

final historyProvider = StateNotifierProvider<HistoryNotifier, HistoryState>((ref) {
  final repository = ref.watch(notificationProvider); // repo 주입
  return HistoryNotifier(repository);
});