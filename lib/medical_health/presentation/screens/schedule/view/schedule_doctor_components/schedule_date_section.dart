import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_clean_arch/core/shared_function/month_date.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view_model/schedule_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view_model/schedule_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view_model/schedule_state.dart';

class ScheduleDate extends StatelessWidget {
  const ScheduleDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> datesAndDaysOfMonth = getDatesAndDaysOfMonth();
    return BlocBuilder<ScheduleBloc, ScheduleStates>(builder: (context, state) {
      int currentIndex = state.selectedScheduleDay;
      ScheduleBloc.get(context).add(
          SelectDateValueEvent(currentDate: datesAndDaysOfMonth[currentIndex]));
      return Container(
        color: ColorManager.lightPrimaryColor,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8.0),
        child: Column(
          spacing: 10.0,
          children: [
            Row(
              spacing: 8,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Month',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: ColorManager.primaryColor,
                          fontSize: 20.0,
                        ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: ColorManager.primaryColor,
                  size: 30.0,
                )
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (currentIndex > 0) {
                      ScheduleBloc.get(context).add(
                          ScheduleSelectDateIndexEvent(
                              index: currentIndex - 1));

                      ScheduleBloc.get(context).add(SelectDateValueEvent(
                          currentDate: datesAndDaysOfMonth[currentIndex]));
                    }
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: ColorManager.primaryColor,
                  ),
                ),
                // Days Container
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(6, (index) {
                        int visibleIndex = currentIndex + index - 3;
                        if (visibleIndex < 0 ||
                            visibleIndex >= datesAndDaysOfMonth.length) {
                          return Container(width: 50);
                        }
                        var item = datesAndDaysOfMonth[visibleIndex];
                        bool isToday = (visibleIndex == currentIndex);
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            height: 80,
                            width: 50,
                            decoration: BoxDecoration(
                              color: isToday
                                  ? ColorManager.primaryColor
                                  : ColorManager.whiteColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${item['day']}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: isToday
                                            ? ColorManager.whiteColor
                                            : ColorManager.lightBlueColor,
                                      ),
                                ),
                                Text(
                                  '${item['shortWeekday']}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w100,
                                        color: isToday
                                            ? ColorManager.whiteColor
                                            : ColorManager.lightBlueColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                // Right Arrow
                InkWell(
                  onTap: () {
                    if (currentIndex < datesAndDaysOfMonth.length - 1) {
                      ScheduleBloc.get(context).add(
                          ScheduleSelectDateIndexEvent(
                              index: currentIndex + 1));
                      ScheduleBloc.get(context).add(SelectDateValueEvent(
                          currentDate: datesAndDaysOfMonth[currentIndex]));
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: ColorManager.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
