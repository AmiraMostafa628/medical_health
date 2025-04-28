import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';

class DescribeYourProblem extends StatelessWidget {
  const DescribeYourProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.0,
        children: [
          Text(
            'Describe your problem',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 16,
                ),
          ),
          Container(
            height: 140,
            padding: EdgeInsets.only(left: 20.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorManager.lightPrimaryColor,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'enter your Problem here...',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.w200)),
            ),
          ),
        ],
      ),
    );
  }
}
