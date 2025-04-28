import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.lightPrimaryColor,
      padding: EdgeInsets.all(20.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(
              20.0,
            )),
        child: TableCalendar(
          firstDay: DateTime.utc(2025, 1, 1),
          lastDay: DateTime.utc(2026, 1, 1),
          focusedDay: DateTime.now(),
          daysOfWeekHeight: 35,
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: ColorManager.primaryColor,
              shape: BoxShape.circle,
            ),
            todayTextStyle: TextStyle(
              color: ColorManager.whiteColor,
              fontSize: 16.0,
            ),
          ),
          calendarBuilders: CalendarBuilders(
            dowBuilder: (context, day) {
              final text = [
                'Sun',
                'Mon',
                'Tue',
                'Wed',
                'Thu',
                'Fri',
                'Sat'
              ][day.weekday - 1];
              return Padding(
                padding: const EdgeInsets.only(right: 6.0, bottom: 10.0),
                child: Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorManager.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
