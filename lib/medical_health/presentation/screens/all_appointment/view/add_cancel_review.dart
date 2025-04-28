import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view/cancel_appointment_reason.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view/custom_appointment_text.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view/custom_review.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/header.dart';

class AddCancelReview extends StatelessWidget {
  const AddCancelReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            spacing: 20.0,
            children: [
              Header(
                title: 'Cancel Appointment',
                onTap: () {
                  GoRouter.of(context).pop();
                },
              ),
              CustomAppointmentText(),
              CancelAppointmentReason(),
              CustomAppointmentText(
                color: ColorManager.hintTextColor,
              ),
              CustomReview(
                title: 'Enter your Reason here...',
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomTextButton(
                text: "Cancel Appointment",
                upperCase: false,
                height: 50,
                borderRadius: BorderRadius.circular(30.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
