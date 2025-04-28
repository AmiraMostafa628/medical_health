import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view/custom_appointment_text.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view/custom_review.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/action_decoration.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/header.dart';

class ReviewAppointment extends StatelessWidget {
  const ReviewAppointment({super.key, required this.doctor});

  final DoctorEntity doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            spacing: 10.0,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Header(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  title: 'Review'),
              CustomAppointmentText(),
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  doctor.docProfile,
                ),
              ),
              Text(
                doctor.docName,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: ColorManager.primaryColor,
                    ),
              ),
              Text(
                doctor.medicalSpecialization,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.w100, fontSize: 16),
              ),
              Row(
                spacing: 5.0,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActionDecoration(
                    icon: Icons.favorite,
                    backgroundColor: ColorManager.lightPrimaryColor,
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: ColorManager.lightPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < doctor.docRate.floor()
                              ? Icons.star
                              : Icons.star_border,
                          color: ColorManager.primaryColor,
                        );
                      }),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CustomReview(
                  title: 'Enter your Comment here...',
                ),
              ),
              CustomTextButton(
                text: "Add Review",
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
