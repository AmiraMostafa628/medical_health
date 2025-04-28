import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/header.dart';

class FinishPaymentHeader extends StatelessWidget {
  const FinishPaymentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: ColorManager.primaryColor,
      padding: EdgeInsets.all(30),
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 50,
        children: [
          Header(
            title: 'Payment',
            color: ColorManager.whiteColor,
            fontSize: 30,
          ),
          Center(
            child: Text(
              '\$ 100.00',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: ColorManager.whiteColor, fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
