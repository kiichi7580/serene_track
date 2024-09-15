import 'package:serene_track/model/enum/category.dart';
import 'package:serene_track/model/src/todo.dart';

final defaultWorkTasks = [
  Todo(
    // id: '',
    title: '仕事を1人で抱え込んでいませんか？',
    description: '少しでも悩みがあったら、他の人に悩みを共有してみましょう。',
    complete: true,
    categoryId: Category.work,
    notificationTime: DateTime.now(),
    createdAt: null,
    // uid: '',
  ),
  const Todo(
    // id: '',
    title: 'ストレス発散の方法',
    description: '今日はストレス発散の時間が取れましたか？',
    complete: false,
    categoryId: Category.work,
    notificationTime: null,
    createdAt: null,
    // uid: '',
  ),
  const Todo(
    // id: '',
    title: '今日は誰かと会話しましたか？',
    description: '誰かと話すことで気持ちが楽になるかもしれません。',
    complete: false,
    categoryId: Category.work,
    notificationTime: null,
    createdAt: null,
    // uid: '',
  ),
];
