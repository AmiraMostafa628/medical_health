import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';

class CustomAppointmentText extends StatelessWidget {
  const CustomAppointmentText({super.key,this.color,});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
        fontWeight: FontWeight.w100,
        color: color?? ColorManager.textBlackColor,
      ),
    );
  }
}
