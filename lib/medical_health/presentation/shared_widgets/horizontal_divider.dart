import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';


class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key, this.height});
  final double?height;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Divider(
        height: height??8.0,
        color: ColorManager.primaryColor,
      ),
    );
  }
}
