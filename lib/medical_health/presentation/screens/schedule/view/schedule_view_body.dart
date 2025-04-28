import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view/schedule_view_body_components/calendar.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view/schedule_view_body_components/schedule_header.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view/schedule_view_body_components/schedule_info.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/information_widget.dart';

class ScheduleViewBody extends StatelessWidget {
  const ScheduleViewBody({
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
              spacing: 15.0,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: ScheduleHeader(
                    doctorModel: doctorModel,
                  ),
                ),
                ScheduleInfo(
                  doctorModel: doctorModel,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: InformationWidget(
                    title: 'Profile',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Calendar(),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
