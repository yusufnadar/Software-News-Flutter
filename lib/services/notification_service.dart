import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:software_news/ui/pages/home_page.dart';
import 'package:timezone/timezone.dart' as tz;
import 'dart:math' as math;

class NotificationApi extends GetxController {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future cancel() async {
    _notifications.cancelAll();
  }

  static Future _details() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'id',
        'name',
        channelDescription: 'heyy',
        icon: "@mipmap/ic_launcher",
        sound: RawResourceAndroidNotificationSound('slate'),
        playSound: true,
        importance: Importance.max,
      ),
    );
  }

  static Future showNotification(tz.TZDateTime scheduledTime,
      {int id = 0, String? title, String? body, String? payload}) async {
    await _notifications.zonedSchedule(
      id,
      title,
      body,
      scheduledTime,
      await _details(),
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static Future<void> createWaterReminderNotification({hour, minute}) async {
    NotificationApi.cancel();
    var now = DateTime.now();
    var thisDay = DateTime.now().day;
    bool isAfter = DateTime(2022, now.month, now.day, hour, minute, now.second,
            now.millisecond, now.microsecond)
        .isAfter(DateTime.now());
    // eğer seçilen tarih öncekinden daha gerideyse sonraki günü gönderiyorum
    isAfter == false ? thisDay += 1 : null;
    switch (DateTime.now().month) {
      case 1:
        {
          await createNotification(
            thisDay: thisDay,
            hour: hour,
            minute: minute,
            dayNumber: 31,
            month: 1,
          );
          await createNotification(
              hour: hour, minute: minute, dayNumber: 28, month: 2);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 3);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 4);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 5);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 6);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 7);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 8);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 9);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 10);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 11);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 12);
        }
        break;
      case 2:
        {
          await createNotification(
            thisDay: thisDay,
            hour: hour,
            minute: minute,
            dayNumber: 28,
            month: 2,
          );
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 3);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 4);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 5);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 6);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 7);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 8);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 9);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 10);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 11);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 12);
        }
        break;
      case 3:
        {
          await createNotification(
            thisDay: thisDay,
            hour: hour,
            minute: minute,
            dayNumber: 31,
            month: 3,
          );
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 4);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 5);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 6);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 7);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 8);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 9);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 10);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 11);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 12);
        }
        break;
      case 4:
        {
          await createNotification(
            thisDay: thisDay,
            hour: hour,
            minute: minute,
            dayNumber: 30,
            month: 4,
          );
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 5);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 6);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 7);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 8);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 9);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 10);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 11);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 12);
        }
        break;
      case 5:
        {
          await createNotification(
              thisDay: thisDay,
              hour: hour,
              minute: minute,
              dayNumber: 31,
              month: 5);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 6);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 7);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 8);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 9);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 10);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 11);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 12);
        }
        break;
      case 6:
        {
          await createNotification(
              thisDay: thisDay,
              hour: hour,
              minute: minute,
              dayNumber: 30,
              month: 6);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 7);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 8);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 9);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 10);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 11);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 12);
        }
        break;
      case 7:
        {
          await createNotification(
              thisDay: thisDay,
              hour: hour,
              minute: minute,
              dayNumber: 31,
              month: 7);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 8);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 9);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 10);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 11);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 12);
        }
        break;
      case 8:
        {
          await createNotification(
              thisDay: thisDay,
              hour: hour,
              minute: minute,
              dayNumber: 31,
              month: 8);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 9);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 10);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 11);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 12);
        }
        break;
      case 9:
        {
          await createNotification(
              thisDay: thisDay,
              hour: hour,
              minute: minute,
              dayNumber: 30,
              month: 9);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 10);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 11);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 12);
        }
        break;
      case 10:
        {
          await createNotification(
              thisDay: thisDay,
              hour: hour,
              minute: minute,
              dayNumber: 31,
              month: 10);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 30, month: 11);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 12);
        }
        break;
      case 11:
        {
          await createNotification(
              thisDay: thisDay,
              hour: hour,
              minute: minute,
              dayNumber: 30,
              month: 11);
          await createNotification(
              hour: hour, minute: minute, dayNumber: 31, month: 12);
        }
        break;
      case 12:
        {
          await createNotification(
              thisDay: thisDay,
              hour: hour,
              minute: minute,
              dayNumber: 31,
              month: 12);
        }
        break;
    }
  }

  static Future createNotification(
      {thisDay, hour, minute, dayNumber, month, motivationList}) async {
    for (int d = thisDay ?? 1; d <= dayNumber; d++) {
      var randomId = math.Random().nextInt(10000000);
      await NotificationApi.showNotification(
        tz.TZDateTime(tz.local, DateTime.now().year, month, d, hour - 3, minute, 0, 0),
        title: 'Check Latest News',
        body: 'There may be new news that may be of interest to you',
        id: randomId,
        payload: 'yusuf.o',

      );
    }
  }

  static init() {
    _notifications.initialize(
        InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'),
            iOS: IOSInitializationSettings()), onSelectNotification: (payload) {
      Get.offAll(() => HomePage());
    });
  }
}
