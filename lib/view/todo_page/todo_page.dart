import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:serene_track/components/my_appbar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/controllers/global/todo_notifier.dart';
import 'package:serene_track/model/enum/category.dart';
import 'package:serene_track/view/todo_add_page/todo_add_page.dart';
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
    final editMode = ref.watch(todoProvider.select((value) => value.editMode));
    return Scaffold(
      backgroundColor: backGroundColor,
      extendBodyBehindAppBar: true,
      appBar: myAppBar(
        title: ref.watch(todayDateTimeNotifierProvider.notifier).getDate(now),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(todoProvider.notifier).changeEditMode();
            },
            icon: Icon(
              LineIcons.edit,
              color: editMode ? selectedColor : textMainColor,
            ),
          ),
          IconButton(
            onPressed: () {
              context.push(TodoAddPage.routeLocation);
            },
            icon: const Icon(LineIcons.plus),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8,
          ),
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
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
                  colors: [
                    categoryColor(Category.all),
                    categoryColor(Category.exercise),
                    categoryColor(Category.sleep),
                    categoryColor(Category.work),
                  ],
                  tabs: const [
                    Text(allTx),
                    Text(exerciseTx),
                    Text(sleepTx),
                    Text(workTx),
                  ],
                  children: const [
                    AllTodoTab(),
                    ExerciseTodoTab(),
                    SleepTodoTab(),
                    WorkTodoTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
