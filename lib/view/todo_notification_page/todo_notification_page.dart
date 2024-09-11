import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:serene_track/components/dialog/show_off_todo_notification_dialog.dart';
import 'package:serene_track/components/my_appbar.dart';
import 'package:serene_track/components/show_snack_bar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/controllers/global/todo_notifier.dart';
import 'package:serene_track/model/src/todo.dart';
import 'package:serene_track/utils/notification/todo_notifications.dart';
import 'package:serene_track/utils/permission/request_notification_permission.dart';
import 'package:serene_track/utils/preferences_manager.dart';

class TodoNotificationPage extends ConsumerStatefulWidget {
  const TodoNotificationPage({super.key});
  static String get routeName => 'todo_notification';
  static String get routeLocation => '/$routeName';
  @override
  TodoNotificationPageState createState() => TodoNotificationPageState();
}

class TodoNotificationPageState extends ConsumerState<TodoNotificationPage> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  List<Todo> todoNotifications = [];

  @override
  void initState() {
    super.initState();
    PreferencesManager().getTodoNotifications.then((notifications) {
      setState(() {
        todoNotifications = notifications;
      });
    });
    init();
  }

  Future<void> init() async {
    try {
      await initRequestNotificationPermission();
      await dailyProteinNotifications(todoNotifications);
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<void> deleteNotification(Todo todo) async {
    setState(() {
      todoNotifications
          .removeWhere((notifications) => notifications.id == todo.id);
    });
    await PreferencesManager()
        .setTodoNotifications(todoNotifications: todoNotifications);
    await flutterLocalNotificationsPlugin.cancel(todo.id);
  }

  Future<String> updateTodo({
    required WidgetRef ref,
    required DateTime? notificationTime,
  }) async {
    String res = failureUpDate;
    res = await ref.read(todoProvider.notifier).offTodoNotification(
          notificationTime: notificationTime,
        );
    if (res == successRes) res = successUpDate;
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: myAppBar(
        title: 'タスク通知設定',
        centerTitle: true,
      ),
      body: todoNotifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  Icon(
                    LineIcons.alternateListAlt,
                    size: 60,
                    color: lightGreyColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'タスクの通知設定して、\n今日のタスクを思い出せるようにしよう！',
                    style: TextStyles.taskTitleStyle.copyWith(
                      color: lightGreyColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 260),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: todoNotifications.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              title: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: todoNotifications[index].categoryId,
                                      style: TextStyles.taskTitleBoldStyle
                                          .copyWith(
                                        color: yellowGreenColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '${todoNotifications[index].title}\n',
                                      style: TextStyles.taskTitleBoldStyle,
                                    ),
                                    if (todoNotifications[index]
                                            .notificationTime !=
                                        null)
                                      TextSpan(
                                        text: '通知${index + 1}: ',
                                        style: TextStyles.taskTitleBoldStyle,
                                      ),
                                    TextSpan(
                                      text:
                                          '${todoNotifications[index].notificationTime!.hour}時${todoNotifications[index].notificationTime!.minute}分',
                                      style: TextStyles.taskTitleBoldStyle,
                                    ),
                                  ],
                                ),
                              ),
                              trailing: Builder(
                                builder: (context) {
                                  return IconButton(
                                    icon:
                                        const Icon(LineIcons.alternateTrash),
                                    onPressed: () async {
                                      final response =
                                          await showOffTodoNotificationDialog(
                                              context);
                                      if (response == null ||
                                          response == false) {
                                        return;
                                      }
                                      ref
                                          .read(todoProvider.notifier)
                                          .setSelectedTodo(
                                              todoNotifications[index]);
                                      String res = await updateTodo(
                                        ref: ref,
                                        notificationTime: null,
                                      );
                                      if (res == successUpDate) {
                                        await deleteNotification(
                                          todoNotifications[index],
                                        );
                                        if (context.mounted) {
                                          showSnackBar(res, context);
                                        }
                                      } else {
                                        if (!context.mounted) return;
                                        showSnackBar(
                                          res,
                                          context,
                                          backgroundColor: noReactionColor,
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
