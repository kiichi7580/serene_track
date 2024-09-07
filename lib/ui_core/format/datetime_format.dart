import 'package:intl/intl.dart';

String formatTimeToHm(DateTime? dateTime) {
  if (dateTime == null) return '00:00';
  return DateFormat.Hm().format(dateTime);
}
