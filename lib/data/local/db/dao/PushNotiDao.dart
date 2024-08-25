import 'package:drift/drift.dart';

import '../Database.dart';

class PushNotiDao {
  final $PushNotiTable _pushNotiTable;

  PushNotiDao(this._pushNotiTable);

  Future<int> addOrUpdateNoti(PushNotiCompanion notiCompanion) =>
      _pushNotiTable.insertOnConflictUpdate(notiCompanion);
}