import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';


class InformationWidget extends StatelessWidget {
  const InformationWidget({
    super.key,
    required this.title,
    this.titleColor,
  });

  final String title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16,
                color: titleColor?? ColorManager.primaryColor,
              ),
        ),
        InformationInfo(),
      ],
    );
  }
}

class InformationInfo extends StatelessWidget {
  const InformationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
        fontWeight: FontWeight.w100,
        color: ColorManager.textBlackColor,
      ),
    );
  }
}

