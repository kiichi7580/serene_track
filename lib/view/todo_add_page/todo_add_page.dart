import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:serene_track/components/button/loading_button.dart';
import 'package:serene_track/components/my_appbar.dart';
import 'package:serene_track/components/picker/drum_roll_time_picker.dart';
import 'package:serene_track/components/show_snack_bar.dart';
import 'package:serene_track/components/button/tooltip_button.dart';
import 'package:serene_track/constant/colors.dart';
import 'package:serene_track/constant/text_source.dart';
import 'package:serene_track/constant/themes/text_styles.dart';
import 'package:serene_track/components/button/custom_button.dart';
import 'package:serene_track/controllers/global/todo_notifier.dart';
import 'package:serene_track/model/enum/category.dart';
import 'package:serene_track/model/enum/form_state.dart';
import 'package:serene_track/ui_core/format/datetime_format.dart';
import 'package:serene_track/view/auth_page/provider/form_provider.dart';
import 'package:serene_track/view/todo_add_page/provider/form_key_for_add_todo_notifier.dart';
import 'package:serene_track/view/todo_add_page/provider/todo_add_page_notifier.dart';
import 'package:serene_track/view/todo_add_page/provider/todo_add_text_field_notifier.dart';
import 'package:serene_track/view/todo_page/components/todo_text_field.dart';
import 'package:serene_track/view/todo_page/todo_page.dart';

class TodoAddPage extends ConsumerWidget {
  const TodoAddPage({super.key});
  static String get routeName => 'add_todo';
  static String get routeLocation => '/$routeName';

  Future<String> addTodo({
    required WidgetRef ref,
    required String title,
    required String description,
    required bool complete,
    required Category categoryId,
    DateTime? notificationTime,
  }) async {
    String res = failureCreate;
    res = await ref.read(todoProvider.notifier).createTodo(
          title: title,
          description: description,
          complete: complete,
          categoryId: categoryId,
          notificationTime: notificationTime,
        );
    if (res == successRes) res = successCreate;
    return res;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = [
      Category.all,
      Category.exercise,
      Category.sleep,
      Category.work,
    ];
    final isLoading =
        ref.watch(todoProvider.select((value) => value.isLoading));
    final formKey = ref.watch(formKeyForAddTodoNotifierProvider);
    final formController = ref.read(formProvider.notifier);
    final titleController = ref.watch(titleControllerNotifierProvider);
    final descriptionController =
        ref.watch(descriptionControllerNotifierProvider);

    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: myAppBar(title: 'タスクを追加'),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            height: MediaQuery.of(context).size.height * 0.87,
            width: MediaQuery.of(context).size.width * 0.94,
            decoration: const BoxDecoration(
              color: backGroundColor,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.04,
                  ),
                  TodoTextField(
                    caption: titleTx,
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                    maxLines: 1,
                    validator: formController.basicValidator,
                  ),
                  const SizedBox(height: 8),
                  const Text(categoryTx, style: TextStyles.caption),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 56,
                    width: 72,
                    child: Consumer(
                      builder: (context, ref, _) {
                        return DropdownButton(
                          dropdownColor: backGroundColor,
                          items: items
                              .map((item) => DropdownMenuItem<Category>(
                                    alignment: AlignmentDirectional.center,
                                    value: item,
                                    child: Text(item.label),
                                  ))
                              .toList(),
                          value: ref.watch(categoryNotifierProvider),
                          onChanged: (value) {
                            ref
                                .read(categoryNotifierProvider.notifier)
                                .setValue(value);
                          },
                          underline: Container(
                            height: 1,
                            color: textMainColor,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  TodoTextField(
                    caption: descriptionTx,
                    controller: descriptionController,
                    keyboardType: TextInputType.text,
                    maxLength: 200,
                    maxLines: 3,
                    validator: formController.basicValidator,
                  ),
                  const SizedBox(height: 8),
                  const Text(notificationSettingTx, style: TextStyles.caption),
                  const SizedBox(height: 24),
                  notificationSettingArea(),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  isLoading
                      ? const LoadingButton()
                      : CustomButton(
                          buttonText: '追加する',
                          onTap: () async {
                            final category =
                                ref.watch(categoryNotifierProvider);
                            final notificationTime = ref.watch(
                                todoAddPageProvider
                                    .select((value) => value.notificationTime));
                            FormStatus formStatus =
                                formController.validateForm(formKey);
                            if (formStatus == FormStatus.valid) {
                              String res = await addTodo(
                                ref: ref,
                                title: titleController.text,
                                description: descriptionController.text,
                                complete: false,
                                categoryId: category!,
                                notificationTime: notificationTime,
                              );
                              if (res == successCreate) {
                                if (!context.mounted) return;
                                context.go(TodoPage.routeLocation);
                                showSnackBar(res, context);
                              } else {
                                if (!context.mounted) return;
                                showSnackBar(
                                  res,
                                  context,
                                  backgroundColor: noReactionColor,
                                );
                              }
                            }
                          },
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget notificationSettingArea() {
    return Consumer(builder: (context, ref, _) {
      final notificationTime = ref
          .watch(todoAddPageProvider.select((value) => value.notificationTime));
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Text(
                formatTimeToHm(notificationTime),
                style: TextStyles.title.copyWith(fontSize: 24),
              ),
              const SizedBox(width: 8),
              tooltipButton(
                notificationTime != null
                    ? '毎日${notificationTime.hour}時${notificationTime.minute}分に通知が送られます。'
                    : '通知時間を設定すると、毎日設定した時間に通知が送られます。',
              ),
            ],
          ),
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
            onPressed: () {
              drumRollTimePicker(
                  context: context,
                  showSecondsColumn: false,
                  onConfirm: (date) {
                    ref
                        .read(todoAddPageProvider.notifier)
                        .selectNotificationTime(date);
                  });
            },
            child: const Text('設定する'),
          ),
        ],
      );
    });
  }
}
