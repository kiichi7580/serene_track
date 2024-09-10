import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:serene_track/model/src/todo.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// タスク通知 複数設定可
Future<void> dailyProteinNotifications(List<Todo> todos) async {
  for (int i = 0; i < todos.length; i++) {
    await dailyTodoNotification(todos[i]);
  }
}

Future<void> dailyTodoNotification(Todo todo) async {
  if (todo.notificationTime == null) {
    await flutterLocalNotificationsPlugin.cancel(todo.id);
    return;
  }
  int hour = todo.notificationTime!.hour;
  int minute = todo.notificationTime!.minute;
  await flutterLocalNotificationsPlugin.zonedSchedule(
    todo.id,
    'Serene Track',
    '$hour時$minute分になりました。\n「${todo.title}」というタスクを達成しましょう！',
    _nextTodoNotification(todo),
    NotificationDetails(
      android: AndroidNotificationDetails(
        'Serene-Track-Todo',
        'Serene-Track-Todo',
        channelDescription:
            '$hour時$minute分になりました。\n「${todo.title}」というタスクを達成しましょう！',
      ),
    ),
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time,
  );
}

tz.TZDateTime _nextTodoNotification(Todo todo) {
  int hour = todo.notificationTime!.hour;
  int minute = todo.notificationTime!.minute;
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate =
      tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute, 0);
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  return scheduledDate;
}
