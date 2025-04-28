import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';


class DoctorNameAndMedicalSpecializationSection extends StatelessWidget {
  const DoctorNameAndMedicalSpecializationSection({
    super.key, required this.model, required this.crossAxisAlignment,
  });

  final DoctorEntity model;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorManager.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        spacing: 5.0,
        children: [
          Text(model.docName,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: ColorManager.primaryColor,

            ),
          ),
          Text(model.medicalSpecialization,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.w100,
                fontSize: 12

            ),
          ),

        ],
      ),
    );
  }
}