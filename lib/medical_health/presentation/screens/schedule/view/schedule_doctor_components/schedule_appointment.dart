import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/models/info_model.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/action_decoration.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/doctor_name_and_medical_specialization_section.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/rating_icon.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/home_view_components/chat_num_icon.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_states.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/header.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/horizontal_divider.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/information_widget.dart';


class ScheduleAppointment extends StatelessWidget {
  ScheduleAppointment({
    super.key,
    required this.doctorModel,
    required this.time,
    required this.selectedDate,
  });

  final DoctorEntity doctorModel;
  final String time;
  final Map<String, String> selectedDate;

  final List<InfoModel> infoModel = [
    InfoModel(title: 'Booking for', titleInfo: 'Another Person'),
    InfoModel(title: 'Full Name', titleInfo: 'Jane Doe'),
    InfoModel(title: 'Age', titleInfo: '30'),
    InfoModel(title: 'Gender', titleInfo: 'Female'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.0,
          children: [
            Header(
              onTap: () {
                GoRouter.of(context).pop();
              },
              title: "Your Appointment",
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: ColorManager.lightPrimaryColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                spacing: 10.0,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      doctorModel.docProfile,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 10.0,
                      children: [
                        DoctorNameAndMedicalSpecializationSection(
                          model: doctorModel,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        Row(
                          spacing: 8.0,
                          children: [
                            RatingIcon(
                              docRating: doctorModel.docRate,
                            ),
                            ChatNumIcon(chatNum: doctorModel.chatNum),
                            Spacer(),
                            ActionDecoration(
                              icon: Icons.question_mark,
                            ),
                            BlocBuilder<HomeBloc, HomeStates>(
                                builder: (context, state) {
                              bool condition = state.favoriteDoctors != null &&
                                  state.favoriteDoctors!.contains(doctorModel);
                              return ActionDecoration(
                                icon: condition
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            HorizontalDivider(
              height: 20,
            ),
            Row(
              spacing: 10.0,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    'Month ${selectedDate['day']} Year 2025',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: ColorManager.whiteColor,
                        ),
                  ),
                ),
                Spacer(),
                ActionDecoration(
                  icon: Icons.check,
                  backgroundColor: ColorManager.primaryColor,
                  iconColor: ColorManager.whiteColor,
                ),
                ActionDecoration(
                  icon: Icons.close,
                  backgroundColor: ColorManager.primaryColor,
                  iconColor: ColorManager.whiteColor,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                '${selectedDate['shortWeekday']}, $time ',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: ColorManager.primaryColor,
                    ),
              ),
            ),
            HorizontalDivider(
              height: 20,
            ),
            Column(
              children: infoModel.map((item) {
                return ListTile(
                  title: Text(
                    item.title,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  trailing: Text(
                    item.titleInfo,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 15,
                        ),
                  ),
                );
              }).toList(),
            ),
            HorizontalDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: InformationWidget(
                title: 'Problem',
                titleColor: ColorManager.textBlackColor,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
