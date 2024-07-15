import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/component/my_appbar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/view/todo_page/add_todo_page.dart';
import 'package:serene_track/view/todo_page/all_todo_tab/all_todo_tab.dart';
import 'package:serene_track/view/todo_page/exercise_todo_tab/exercise_todo_tab.dart';
import 'package:serene_track/view/todo_page/provider/today_datetime_notifier.dart';
import 'package:serene_track/view/todo_page/work_todo_tab/work_todo_tab.dart';
import 'package:serene_track/view/todo_page/sleep_todo_tab/sleep_todo_tab.dart';
import 'package:tab_container/tab_container.dart';

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({super.key});
  static String get routeName => 'todo';
  static String get routeLocation => '/$routeName';

  @override
  TodoPageState createState() => TodoPageState();
}

class TodoPageState extends ConsumerState<TodoPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final now = ref.watch(todayDateTimeNotifierProvider);
    return Scaffold(
      appBar: myAppBar(
        title: ref.watch(todayDateTimeNotifierProvider.notifier).getDate(now),
        actions: [
          IconButton(
            onPressed: () {
              context.push(AddTodoPage.routeLocation);
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      backgroundColor: backGroundColor,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.94,
          child: TabContainer(
            controller: _tabController,
            tabEdge: TabEdge.top,
            tabsStart: 0,
            tabsEnd: 1,
            tabMaxLength: 100,
            borderRadius: BorderRadius.circular(10),
            tabBorderRadius: BorderRadius.circular(10),
            childPadding: const EdgeInsets.all(20.0),
            selectedTextStyle: const TextStyle(
              color: textMainColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            unselectedTextStyle: const TextStyle(
              fontSize: 13,
              color: textMainColor,
            ),
            colors: const [
              sandwispColor,
              yellowGreenColor,
              mantisColor,
              appleColor,
            ],
            tabs: const [
              Text('すべて'),
              Text('運動'),
              Text('睡眠'),
              Text('仕事'),
            ],
            children: const [
              AllTodoTab(),
              ExerciseTodoTab(),
              SleepTodoTab(),
              WorkTodoTab(),
            ],
          ),
        ),
      ),
    );
  }
}

// class TodoPage extends ConsumerWidget {
//   const TodoPage({super.key});
//   static String get routeName => 'todo';
//   static String get routeLocation => '/$routeName';

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final now = ref.watch(todayDateTimeNotifierProvider);
//     // final tabController = ref.watch(tabControllerProvider);
//     final tabController = ref.watch(todoPageProvider).controller;

//     return Scaffold(
//       appBar: myAppBar(
//         title: ref.watch(todayDateTimeNotifierProvider.notifier).getDate(now),
//         actions: [
//           IconButton(
//             onPressed: () {
//               context.push(AddTodoPage.routeLocation);
//             },
//             icon: const Icon(
//               Icons.add,
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: backGroundColor,
//       body: Center(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height * 0.9,
//           width: MediaQuery.of(context).size.width * 0.94,
//           child: TabContainer(
//             controller: tabController,
//             tabEdge: TabEdge.top,
//             tabsStart: 0,
//             tabsEnd: 1,
//             tabMaxLength: 100,
//             borderRadius: BorderRadius.circular(10),
//             tabBorderRadius: BorderRadius.circular(10),
//             childPadding: const EdgeInsets.all(20.0),
//             selectedTextStyle: const TextStyle(
//               color: textMainColor,
//               fontSize: 15,
//               fontWeight: FontWeight.bold,
//             ),
//             unselectedTextStyle: const TextStyle(
//               fontSize: 13,
//               color: textMainColor,
//             ),
//             colors: const [
//               sandwispColor,
//               yellowGreenColor,
//               mantisColor,
//               appleColor,
//             ],
//             tabs: const [
//               Text('すべて'),
//               Text('運動'),
//               Text('睡眠'),
//               Text('仕事'),
//             ],
//             children: const [
//               AllTodoTab(),
//               ExerciseTodoTab(),
//               SleepTodoTab(),
//               WorkTodoTab(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }