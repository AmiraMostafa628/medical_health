import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/models/available_time_model.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view_model/schedule_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view_model/schedule_state.dart';


class AvailableTime extends StatelessWidget {
  AvailableTime({
    super.key,
    required this.doctorModel,
  });

  final DoctorEntity doctorModel;

  final List<AvailableTimeModel> items = [
    AvailableTimeModel(
        item: '9:00 AM',
        itemColor: ColorManager.hintTextColor,
        itemBackgroundColor: ColorManager.textFromFieldColor),
    AvailableTimeModel(
        item: '9:30 AM',
        itemColor: ColorManager.hintTextColor,
        itemBackgroundColor: ColorManager.textFromFieldColor),
    AvailableTimeModel(
        item: '10:00 AM',
        itemColor: ColorManager.whiteColor,
        itemBackgroundColor: ColorManager.primaryColor),
    AvailableTimeModel(
        item: '10:30 AM',
        itemColor: ColorManager.hintTextColor,
        itemBackgroundColor: ColorManager.textFromFieldColor),
    AvailableTimeModel(
        item: '11:00 AM',
        itemColor: ColorManager.hintTextColor,
        itemBackgroundColor: ColorManager.textFromFieldColor),
    AvailableTimeModel(
        item: '11:30 AM',
        itemColor: ColorManager.textBlackColor,
        itemBackgroundColor: ColorManager.lightPrimaryColor),
    AvailableTimeModel(
        item: '12:00 PM',
        itemColor: ColorManager.hintTextColor,
        itemBackgroundColor: ColorManager.textFromFieldColor),
    AvailableTimeModel(
        item: '12:30 PM',
        itemColor: ColorManager.hintTextColor,
        itemBackgroundColor: ColorManager.textFromFieldColor),
    AvailableTimeModel(
        item: '1:00 PM',
        itemColor: ColorManager.textBlackColor,
        itemBackgroundColor: ColorManager.lightPrimaryColor),
    AvailableTimeModel(
        item: '1:30 PM',
        itemColor: ColorManager.textBlackColor,
        itemBackgroundColor: ColorManager.lightPrimaryColor),
    AvailableTimeModel(
        item: '2:00 PM',
        itemColor: ColorManager.hintTextColor,
        itemBackgroundColor: ColorManager.textFromFieldColor),
    AvailableTimeModel(
        item: '2:30 PM',
        itemColor: ColorManager.textBlackColor,
        itemBackgroundColor: ColorManager.lightPrimaryColor),
    AvailableTimeModel(
        item: '3:00 PM',
        itemColor: ColorManager.textBlackColor,
        itemBackgroundColor: ColorManager.lightPrimaryColor),
    AvailableTimeModel(
        item: '3:30 PM',
        itemColor: ColorManager.hintTextColor,
        itemBackgroundColor: ColorManager.textFromFieldColor),
    AvailableTimeModel(
        item: '4:00 PM',
        itemColor: ColorManager.hintTextColor,
        itemBackgroundColor: ColorManager.textFromFieldColor),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available Time',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: ColorManager.primaryColor,
                  fontSize: 16.0,
                ),
          ),
          BlocBuilder<ScheduleBloc,ScheduleStates>(
            builder: (context, state) {
              return Wrap(
                spacing: 4.0,
                children: items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.kScheduleAppointment,
                          extra: {
                            'doctorModel': doctorModel,
                            'time': item.item,
                            'selectedDate': state.currentDate,
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.0,
                          vertical: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: item.itemBackgroundColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          item.item,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: item.itemColor),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          )
        ],
      ),
    );
  }
}
