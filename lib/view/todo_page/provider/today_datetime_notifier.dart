import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'today_datetime_notifier.g.dart';

@riverpod
class TodayDateTimeNotifier extends _$TodayDateTimeNotifier {
  @override
  DateTime build() {
    init();
    return DateTime.now();
  }

  Future<void> init() async {
    await initializeDateFormatting('ja_JP');
  }

  String getDate(DateTime now) {
    return '${DateFormat.yMMMd('ja').format(now)}(${DateFormat.E('ja').format(now)})';
  }
}
