import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key,
    this.borderRadius,
    required this.text,
    this.fontSize = 17.0,
    this.onPressed, this.height,
    this.upperCase=true,
    this.fontWeight = FontWeight.bold,
    this.backGroundColor,
    this.fontColor, this.width});

  final BorderRadius? borderRadius;
  final String text;
  final double fontSize;
  final Color? fontColor;
  final double? height;
  final double? width;
  final void Function()? onPressed;
  final bool upperCase;
  final FontWeight fontWeight;
  final Color? backGroundColor;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??60,
      width: width??double.infinity,
      child: TextButton(
          onPressed:onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backGroundColor?? ColorManager.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius??BorderRadius.circular(10),
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              upperCase?text.toUpperCase():text,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: fontColor??ColorManager.whiteColor,
            ),),
          )),
    );
  }
}


