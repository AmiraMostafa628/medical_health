import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';


class BottomIndicator extends StatelessWidget {
  const BottomIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 140,
      decoration: BoxDecoration(
          color: ColorManager.textBlackColor,
          borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}
