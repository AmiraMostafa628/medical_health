import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view/schedule_doctor_components/describe_your_problem.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view/schedule_doctor_components/patient_details.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view/schedule_doctor_components/schedule_date_section.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view/schedule_doctor_components/schedule_doctor_header.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/horizontal_divider.dart';

import 'schedule_doctor_components/available_time.dart';

class ScheduleDoctor extends StatelessWidget {
  const ScheduleDoctor({
    super.key,
    required this.doctorModel,
  });

  final DoctorEntity doctorModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20.0,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                child: ScheduleDoctorHeader(
                  doctorModel: doctorModel,
                ),
              ),
              ScheduleDate(),
              AvailableTime(
                doctorModel: doctorModel,
              ),
              HorizontalDivider(),
              PatientDetails(),
              HorizontalDivider(),
              DescribeYourProblem(),
            ],
          ),
        )),
      ),
    );
  }
}
