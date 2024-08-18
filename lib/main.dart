import 'package:flutter/material.dart';
import 'package:push_notify/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '일정 푸시 알림이',
      routerConfig: router,
      supportedLocales: const [Locale('ko', '')],
    );
  }
}
