import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_page_notifier.freezed.dart';

@freezed
class TodoPageState with _$TodoPageState {
  factory TodoPageState({
    required TabController controller,
    // required TickerProvider vsync,
  }) = _TodoPageState;
  TodoPageState._();
}

// final todoPageProvider =
//     StateNotifierProvider<TodoPageStateController, TodoPageState>(
//         (ref) => throw UnimplementedError());

// class TodoPageStateController extends StateNotifier<TodoPageState> {
//   TodoPageStateController({required TickerProvider vsync})
//       : super(
//             TodoPageState(controller: TabController(length: 4, vsync: vsync)));

//   void setController(TabController controller) {
//     state = state.copyWith(controller: controller);
//   }

//   @override
//   void dispose() {
//     state.controller.dispose();
//     super.dispose();
//   }
// }
