import 'package:intl/intl.dart';

List<Map<String, String>> getDatesAndDaysOfMonth() {
  List<Map<String, String>> daysOfMonth = [];
  DateTime now = DateTime.now();
  int daysInMonth  = DateTime(now.year, now.month + 1, 0).day;

  for (int i = 0; i < daysInMonth; i++) {
    DateTime currentDay = DateTime(now.year, now.month, i);
    String day = DateFormat('dd').format(currentDay);
    String shortWeekday = DateFormat('EEE').format(currentDay);
    String fullWeekday = DateFormat('EEEE').format(currentDay);
    daysOfMonth.add(
        {'day': day, 'shortWeekday': shortWeekday, 'fullWeekday': fullWeekday});
  }

  return daysOfMonth;
}