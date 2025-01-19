import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:push_notify/ui/components/basedrawer.dart';
import 'package:push_notify/ui/components/emptypage.dart';
import 'package:push_notify/data/database/daos/notidao.dart';
import 'package:push_notify/providers/notificationStateNotifier.dart';
import 'package:intl/intl.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPage();
}

class _MainPage extends ConsumerState<MainPage> {
  Widget emptyPage = EmptyPage();
  int page = 0;
  int limit = 8;
  bool loading = false, allLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //ref.read(notificationListProvider.notifier).fetchNotifications(page, limit);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    //_scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final notiDao = ref.watch(notiDaoProvider);
    //final list = [];

    final list = ref.watch(notificationListProvider);

    print(list);

    return PopScope(
        canPop: true,
        child: Scaffold(
          //return Scaffold(
            appBar: AppBar(
              title: const Text("푸시 알림"),
            ),
            drawer: const BaseDrawer(),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () => {
                context.pushNamed('setting', extra: {'title': '', 'id': 0})
                //Navigator.pushNamed(context, 'set')
              },
              label: const Text("작성하기"),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    // color: Colors.grey,
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: list.isEmpty ? emptyPage : emptyPage, //addlistView(list),
                  ),
                  flex: 9,
                )
              ],
            )
        )
    );
  }
}