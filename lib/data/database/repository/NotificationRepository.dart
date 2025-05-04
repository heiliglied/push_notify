import 'dart:async';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:push_notify/data/database/daos/NotificationDao.dart';
import 'package:push_notify/data/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class Notificationrepository {
  final NotificationDao notificationDao;
  Notificationrepository(this.notificationDao);

  Future<int?> addNotification(Map<String, dynamic> data) async {
    final notificationData = NotificationCompanion(
      date: Value(data['date']),
      title: Value(data['title']),
      contents: Value(data['contents']),
      sound: data['sound'] == '' ? Value('assets/music/Fur Elise (by Beethoven) - Beethoven.mp3') : Value(data['sound']),
      alarm: Value(data['alarm']),
      status: Value(data['status']),
    );

    try {
      return notificationDao.insertNoti(notificationData);
    } on SqliteException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<int?> updateNotification(int id, Map<String, dynamic> data) async {
    try {
      final notificationData = NotificationCompanion(
        date: Value(data['date']),
        title: Value(data['title']),
        contents: Value(data['contents']),
        sound: data['sound'] == '' ? Value('assets/music/Fur Elise (by Beethoven) - Beethoven.mp3') : Value(data['sound']),
        alarm: Value(data['alarm']),
      );

      return notificationDao.updateNoti(id, notificationData);
    } on SqliteException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<NotificationData?> getNotification(int id) async {
    return notificationDao.getNotification(id);
  }
}
