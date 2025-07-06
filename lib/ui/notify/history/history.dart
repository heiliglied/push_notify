import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:push_notify/data/database/database.dart';
import 'package:push_notify/ui/components/basedrawer.dart';
import 'package:push_notify/ui/components/emptypage.dart';
import 'package:push_notify/ui/components/detailbottomsheet.dart';
import 'package:intl/intl.dart';
import 'package:push_notify/ui/notify/history/historyPaginationProvider.dart';
import 'package:push_notify/ui/notify/history/historyProvider.dart';

class History extends ConsumerStatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  ConsumerState<History> createState() => _History();
}

class _History extends ConsumerState<History> {
  Widget emptyPage = EmptyPage();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final pagination = ref.read(historyPaginationProvider);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
        pagination.fetchNextThrottled();
      }
    });

    Future.microtask(() {
      pagination.fetchNextThrottled();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget addlistView(List<NotificationData> notiList) {
    return ListView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          DateTime date = notiList[index].date;
          String format = DateFormat('yyyy-MM-dd HH:mm').format(date);
          return GestureDetector(
              onTap: () async {
                DetailBottomSheet()
                  ..showBottomSheet(context, notiList[index], index, ref).then((value) {
                    if (mounted && value != null) {
                      setState(() {
                        notiList.removeAt(value);
                      });
                    }
                  });
              },
              child: Card(
                  child: SizedBox(
                      height: 80,
                      child: ListTile(
                        title: Text("지정시간 : $format"),
                        subtitle: Text("알림 : ${notiList[index].title}"),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      ))));
        },
        itemCount: notiList.length);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(historyProvider);
    final notifications = state.notifications;

    return PopScope(
        canPop: true,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("알림 내역"),
            ),
            drawer: const BaseDrawer(),
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: SearchBar(
                    trailing: [
                      IconButton(
                        icon: const Icon(Icons.keyboard_voice),
                        onPressed: () {
                          print('음성 명령 사용');
                        },
                      ),
                      const Icon(Icons.search),
                      IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () {
                          print('달력 선택');
                        },
                      ),
                    ],
                    onSubmitted: (value) {
                      final notifier = ref.read(historyProvider.notifier);
                      final pagination = ref.read(historyPaginationProvider);

                      final newCondition = state.condition.copyWith(
                        search: value,
                        start_day: state.condition.start_day,
                        end_day: state.condition.end_day,
                      );

                      notifier.reset(condition: newCondition);
                      pagination.fetchNextThrottled();
                    },
                  ),
                ),
                Expanded(
                  child: notifications.isEmpty
                      ? Center(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: emptyPage,
                    ),
                  )
                      : Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: addlistView(notifications), // ListView.builder를 직접 사용
                  ),
                ),
              ],
            )));
  }
}