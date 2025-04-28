import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';


class ActionDecoration extends StatelessWidget {
  const ActionDecoration({
    super.key,
    required this.icon,
    this.iconSize,
    this.backgroundColor,
    this.iconColor,
  });

  final IconData icon;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: backgroundColor ?? ColorManager.whiteColor,
      child: Icon(
        icon,
        size: iconSize ?? 18,
        color: iconColor ?? ColorManager.primaryColor,
      ),
    );
  }
}
