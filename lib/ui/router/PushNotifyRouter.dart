import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:push_notify/ui/router/Screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Main().route,
      builder: (BuildContext context, GoRouterState state) {
        return Main().builder(context);
      }
    ),
  ]
)