import 'package:go_router/go_router.dart';
import 'package:push_notify/ui/mainpage.dart';
import 'package:push_notify/ui/setnotify.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: "main",
      builder: (context, state) => MainPage(),
    ),
    GoRoute(
      path: "/setting",
      name: "setting",
      builder: (context, state) => SetNotify(),
    ),
  ]
);