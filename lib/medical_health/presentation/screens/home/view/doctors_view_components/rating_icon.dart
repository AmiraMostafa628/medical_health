import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';

class RatingIcon extends StatelessWidget {
  const RatingIcon({super.key, required this.docRating, this.color,});

  final num docRating;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color ?? ColorManager.whiteColor,
      ),
      child: Row(
        spacing: 5,
        children: [
          Icon(
            Icons.star,
            color: ColorManager.primaryColor,
            size: 16,
          ),
          Text(
            docRating.toString(),
            style: TextStyle(color: ColorManager.primaryColor),
          )
        ],
      ),
    );
  }
}
