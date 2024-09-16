import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/view/todo_page/todo_page.dart';

class TaskAddPromotion extends StatelessWidget {
  const TaskAddPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          side: const BorderSide(
            color: appleColor,
          ),
          foregroundColor: appleColor,
          backgroundColor: backGroundColor,
        ),
        onPressed: () {
          context.go(TodoPage.routeLocation);
        },
        child: const Text('タスクを追加する'),
      ),
    );
  }
}
