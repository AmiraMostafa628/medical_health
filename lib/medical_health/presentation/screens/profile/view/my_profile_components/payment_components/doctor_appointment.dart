import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_health_clean_arch/core/shared_function/initial_orders.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/rating_icon.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/home_view_components/chat_num_icon.dart';

class DoctorAppointment extends StatelessWidget {
  const DoctorAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.0,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
            doctorsModel[0].docProfile,
          ),
        ),
        Expanded(
          child: Column(
            spacing: 2.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 12.0,
                children: [
                  Text(
                    doctorsModel[0].docName,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: ColorManager.primaryColor,
                        ),
                  ),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: ColorManager.primaryColor,
                    child: Icon(
                      FontAwesomeIcons.award,
                      size: 18,
                      color: ColorManager.whiteColor,
                    ),
                  ),
                ],
              ),
              Text(
                doctorsModel[0].medicalSpecialization,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.w100, fontSize: 14),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                spacing: 10.0,
                children: [
                  RatingIcon(
                    docRating: doctorsModel[0].docRate,
                    color: ColorManager.lightPrimaryColor,
                  ),
                  ChatNumIcon(
                    chatNum: doctorsModel[0].chatNum,
                    color: ColorManager.lightPrimaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
