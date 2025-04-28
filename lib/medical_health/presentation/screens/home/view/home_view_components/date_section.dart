import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:medical_health_clean_arch/core/shared_function/week_date.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_states.dart';

class DateSection extends StatelessWidget {
  const DateSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> datesAndDaysOfWeek = getDatesAndDaysOfWeek();
    return BlocBuilder<HomeBloc, HomeStates>(builder: (context, state) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        color: ColorManager.lightPrimaryColor,
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: datesAndDaysOfWeek.asMap().entries.map((entry) {
                int index = entry.key;
                var item = entry.value;
                return GestureDetector(
                  onTap: () {
                    HomeBloc.get(context).add(SelectedDayEvent(index: index));
                  },
                  child: Container(
                    height: 80,
                    width: 50,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 10),
                    decoration: BoxDecoration(
                        color: state.selectedWeekIndex == index
                            ? ColorManager.primaryColor
                            : ColorManager.whiteColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      spacing: 10,
                      children: [
                        Text(
                          '${item['day']}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.w500,
                                color: state.selectedWeekIndex == index
                                    ? ColorManager.whiteColor
                                    : ColorManager.textBlackColor,
                              ),
                        ),
                        Text(
                          '${item['shortWeekday']}',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontWeight: FontWeight.w100,
                                    color: state.selectedWeekIndex == index
                                        ? ColorManager.whiteColor
                                        : ColorManager.textBlackColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: ColorManager.whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${datesAndDaysOfWeek[state.selectedWeekIndex]['day']} - ${datesAndDaysOfWeek[state.selectedWeekIndex]['fullWeekday']}',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: ColorManager.primaryColor,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Row(
                    spacing: 10.0,
                    children: [
                      Text(
                        '9 am',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                fontWeight: FontWeight.w100,
                                color: ColorManager.primaryColor,
                                fontSize: 12),
                      ),
                      Expanded(
                        child: LayoutBuilder(builder: (context, constraints) {
                          return Dash(
                              direction: Axis.horizontal,
                              length: constraints.maxWidth,
                              dashLength: 5,
                              dashColor: ColorManager.primaryColor,);
                        }),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    spacing: 12,
                    children: [
                      Column(
                        spacing: 20,
                        children: [
                          Text(
                            '10 am',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    fontWeight: FontWeight.w100,
                                    color: ColorManager.primaryColor,
                                    fontSize: 12,),
                          ),
                          Text(
                            '11 am',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    fontWeight: FontWeight.w100,
                                    color: ColorManager.primaryColor,
                                    fontSize: 12),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              color: ColorManager.lightPrimaryColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            spacing: 5.0,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Dr. Olivia Turner, M.D.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w900,
                                              color: ColorManager.primaryColor),
                                    ),
                                  ),
                                  CircleAvatar(
                                      radius: 10,
                                      backgroundColor: ColorManager.whiteColor,
                                      child: Icon(
                                        Icons.check,
                                        color: ColorManager.primaryColor,
                                        size: 15,
                                      )),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  CircleAvatar(
                                      radius: 10,
                                      backgroundColor: ColorManager.whiteColor,
                                      child: Icon(
                                        Icons.close,
                                        color: ColorManager.primaryColor,
                                        size: 15,
                                      )),
                                ],
                              ),
                              Text(
                                'Treatment and prevention of skin and photodermatitis.',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    spacing: 10.0,
                    children: [
                      Text(
                        '12 pm',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                fontWeight: FontWeight.w100,
                                color: ColorManager.primaryColor,
                                fontSize: 12,),
                      ),
                      Expanded(
                        child: LayoutBuilder(builder: (context, constraints) {
                          return Dash(
                              direction: Axis.horizontal,
                              length: constraints.maxWidth,
                              dashLength: 5,
                              dashColor: ColorManager.primaryColor,);
                        }),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
