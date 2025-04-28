import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';

class CustomReview extends StatelessWidget {
  const CustomReview({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        color: ColorManager.textFromFieldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: title,
            hintStyle:
            Theme.of(context).textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.w100,
              color: ColorManager.primaryColor,
            )),
      ),
    );
  }
}
