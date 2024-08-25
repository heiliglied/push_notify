import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SetNotify extends StatefulWidget {
  final String title;
  final int id;

  const SetNotify({Key? key, this.title = '', this.id = 0}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SetNotify();
}

class _SetNotify extends State<SetNotify> {
  @override
  Widget build(BuildContext context) {
    double widgetWidth = MediaQuery.of(context).size.width;
    double widgetHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("메시지 작성"),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.goNamed('main');
              //Navigator.pushNamed(context, Routes.mainPage);
            }
        ),
      ),
    );
  }
}