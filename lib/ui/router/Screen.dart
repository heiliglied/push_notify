import 'package:flutter/widgets.dart';
import 'package:push_notify/ui/screen/MainScreen.dart';

sealed class Screen {
  String route;
  WidgetBuilder builder;

  Screen(this.route, this.builder);
}

// Main 화면
class Main extends Screen {
  Main() : super('/', (context) => const MainScreen());
}
