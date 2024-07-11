import 'package:flutter/material.dart';
import 'package:serene_track/component/my_appbar.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/view/todo_page/widgets/add_todo_button.dart';
import 'package:serene_track/view/todo_page/widgets/todo_text_field.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});
  static String get routeName => 'add_todo';
  static String get routeLocation => '/$routeName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: 'タスクを追加'),
      backgroundColor: backGroundColor,
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        width: MediaQuery.of(context).size.width * 0.94,
        decoration: const BoxDecoration(
          color: backGroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.04,
            ),
            TodoTextField(
              caption: titleTx,
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
              maxLength: 50,
              maxLines: 1,
              // this.validator,
              // this.onSaved,
            ),
            const SizedBox(height: 8),
            const Text(categoryTx, style: TextStyles.caption),
            const SizedBox(height: 8),
            DropdownButton(
              items: const [
                DropdownMenuItem(value: allTx, child: Text(allTx)),
                DropdownMenuItem(value: exerciseTx, child: Text(exerciseTx)),
                DropdownMenuItem(value: sleepTx, child: Text(sleepTx)),
                DropdownMenuItem(value: workTx, child: Text(workTx)),
              ],
              value: allTx,
              onChanged: dropdownCallback,
              underline: Container(
                height: 1,
                color: textMainColor,
              ),
            ),
            const SizedBox(height: 8),
            TodoTextField(
              caption: descriptionTx,
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
              maxLength: 200,
              maxLines: 3,
              // this.validator,
              // this.onSaved,
            ),
            const SizedBox(height: 8),
            const Text(notificationSettingTx, style: TextStyles.caption),
            const SizedBox(height: 24),
            notificationSettingArea(),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            AddTodoButton(
              onTap: () {},
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
    );
  }

  Widget notificationSettingArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: const BorderSide(
              color: unselectedColor,
            ),
            foregroundColor: unselectedColor,
            backgroundColor: backGroundColor,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {},
          child: const Text('なし'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: backGroundColor,
            backgroundColor: unselectedColor,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {},
          child: const Text('あり'),
        ),
      ],
    );
  }

  void dropdownCallback(String? value) {}
}
