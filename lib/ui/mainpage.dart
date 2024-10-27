import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:push_notify/ui/components/basedrawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
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

              ],
            )
        )
    );
  }
}