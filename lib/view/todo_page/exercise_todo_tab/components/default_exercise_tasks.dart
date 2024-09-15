import 'package:serene_track/model/enum/category.dart';
import 'package:serene_track/model/src/todo.dart';

final defaultExerciseTasks = [
  Todo(
    // id: '',
    title: '5000歩歩く',
    description:
        '最低でも毎日5000歩以上は歩きましょう。この5000歩を切り出すと、睡眠の質が下がったり、足の骨がスカスカになったり、心疾患や糖尿病などのリスクが上がったりするという研究結果が出ています。',
    complete: true,
    categoryId: Category.exercise,
    notificationTime: DateTime.now(),
    createdAt: null,
    // uid: '',
  ),
  const Todo(
    // id: '',
    title: '7500歩歩く',
    description:
        '7500歩歩くと、良好な体調や健康状態の維持、また睡眠の質の改善が見込めます。加えて、さまざまな病気のリスクも大きく下がります。',
    complete: false,
    categoryId: Category.exercise,
    notificationTime: null,
    createdAt: null,
    // uid: '',
  ),
  const Todo(
    // id: '',
    title: '10000歩歩く',
    description:
        '1日10000歩を超えると、メンタル状態の明確な改善や体のアンチエイジング効果、肥満解消効果などを得られるようになります。理想的な歩数です。',
    complete: false,
    categoryId: Category.exercise,
    notificationTime: null,
    createdAt: null,
    // uid: '',
  ),
];
