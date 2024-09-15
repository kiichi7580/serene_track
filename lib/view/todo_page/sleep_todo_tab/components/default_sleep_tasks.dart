import 'package:serene_track/model/enum/category.dart';
import 'package:serene_track/model/src/todo.dart';

final defaultSleepTasks = [
  Todo(
    // id: '',
    title: '7時間以上の睡眠をとる',
    description:
        '厚生労働省の複数の調査研究から、７時間前後の睡眠時間の人が、生活習慣病やうつ病の発症および死亡に至る危険性が最も低く、これより長い睡眠、短い睡眠のいずれもこれらの危険性を増加させることから、成人においておおよそ６～８時間が適正睡眠時間と考えられています。',
    complete: true,
    categoryId: Category.sleep,
    notificationTime: DateTime.now(),
    createdAt: null,
    // uid: '',
  ),
  const Todo(
    // id: '',
    title: '朝カーテンを開けて太陽の光を浴びる',
    description:
        '朝日を浴びることで、体内時計をリセットし、日中の意欲的な活動を促してくれます。また、その日の夜の快眠を促すことにもつながります。',
    complete: false,
    categoryId: Category.sleep,
    notificationTime: null,
    createdAt: null,
    // uid: '',
  ),
  const Todo(
    // id: '',
    title: '昼ごろに15〜20分程度昼寝をする',
    description:
        '午後の早い時刻に15～30分程度昼寝をすると、日中の眠気による作業効率を改善させるといわれています。ただし30分以上の昼寝は、夜の睡眠に影響するため避けましょう。',
    complete: false,
    categoryId: Category.sleep,
    notificationTime: null,
    createdAt: null,
    // uid: '',
  ),
];
