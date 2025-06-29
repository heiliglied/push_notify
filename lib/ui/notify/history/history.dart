import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:push_notify/ui/components/basedrawer.dart';
import 'package:push_notify/ui/components/emptypage.dart';
import 'package:push_notify/data/database/daos/NotificationDao.dart';
import 'package:push_notify/ui/components/detailbottomsheet.dart';
import 'package:intl/intl.dart';

class History extends ConsumerStatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  ConsumerState<History> createState() => _History();
}

class _History extends ConsumerState<History> {
  Widget emptyPage = EmptyPage();

  final ScrollController _scrollController = ScrollController();
  String search = "";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
        fatchList(); // 개선된 버전에서는 페이지 증가를 fatchList 내부에서 처리
      }
    });
    fatchList();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }



  Widget addlistView(List<dynamic> notiList) {
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
                      search = value;
                      page = 0;
                      list.clear();
                      allLoaded = false;
                      fatchList();
                    },
                  ),
                ),
                Expanded(
                  child: list.isEmpty
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
                    child: addlistView(list),
                  ),
                ),
              ],
            )));
  }
}