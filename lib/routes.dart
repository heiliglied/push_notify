import 'package:go_router/go_router.dart';
import 'package:push_notify/ui/mainpage.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: "index",
      builder: (context, state) => MainPage(),
    ),
  ]
);