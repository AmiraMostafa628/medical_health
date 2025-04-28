import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';


class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.title,
    this.onTap,
    this.color,
    this.fontSize,
  });

  final String title;
  final Color? color;
  final void Function()? onTap;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap ?? () {},
          child: Icon(
            Icons.arrow_back_ios,
            color: color ?? ColorManager.primaryColor,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(
                  color: color ?? ColorManager.primaryColor,
                  fontSize: fontSize ?? 24,
              ),
            ),
          ),
        )
      ],
    );
  }
}
