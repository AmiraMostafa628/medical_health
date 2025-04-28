import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view/cancelled_appointment.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view/complete_appointment.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view/upcoming_appointment.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view_model/all_appointment_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view_model/all_appointment_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view_model/all_appointment_states.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/header.dart';

class AllAppointmentView extends StatelessWidget {
  AllAppointmentView({super.key});

  final List<Widget> appointmentBody = [
    CompleteAppointment(),
    UpcomingAppointment(),
    CancelledAppointment(),
  ];

  final List<String> appointmentType = ['Complete', 'Upcoming', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentBloc, AppointmentStates>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 20,
          children: [
            Header(title: "All Appointment"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: appointmentType.asMap().entries.map((e) {
                int index = e.key;
                var item = e.value;
                return GestureDetector(
                  onTap: () {
                    AppointmentBloc.get(context)
                        .add(ChangeAppointmentTypeEvent(index: index));
                  },
                  child: IntrinsicWidth(
                    child: CustomTextButton(
                      text: item,
                      height: 48,
                      upperCase: false,
                      fontColor: state.changeAppointmentIndex == index
                          ? ColorManager.whiteColor
                          : ColorManager.primaryColor,
                      backGroundColor: state.changeAppointmentIndex == index
                          ? ColorManager.primaryColor
                          : ColorManager.lightPrimaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                );
              }).toList(),
            ),

            appointmentBody[state.changeAppointmentIndex],
          ],
        ),
      );
    });
  }
}
