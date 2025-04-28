import 'package:intl/intl.dart';

List<Map<String, String>> getDatesAndDaysOfWeek() {
  List<Map<String, String>> datesAndDays = [];
  DateTime now = DateTime.now();

  for (int i = 0; i < 6; i++) {
    DateTime currentDay = now.add(Duration(days: i));
    String day = DateFormat('dd').format(currentDay);
    String shortWeekday = DateFormat('EEE').format(currentDay);
    String fullWeekday = DateFormat('EEEE').format(currentDay);
    datesAndDays.add(
        {'day': day, 'shortWeekday': shortWeekday, 'fullWeekday': fullWeekday});
  }

  return datesAndDays;
}


