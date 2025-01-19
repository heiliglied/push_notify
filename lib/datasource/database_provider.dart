import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:push_notify/data/database/database.dart';

final databaseProvider = Provider<Database>((ref) => Database());
