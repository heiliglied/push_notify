import 'package:get_it/get_it.dart';
import 'package:push_notify/ui/screen/MainViewModel.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => MainViewModel());
}