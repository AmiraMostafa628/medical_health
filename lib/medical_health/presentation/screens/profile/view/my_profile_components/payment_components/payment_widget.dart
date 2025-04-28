import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({
    super.key,
    required this.value,
    required this.title,
    required this.icon,
  });

  final int value;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.textFromFieldColor,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        leading: Icon(
         icon,
          color: ColorManager.primaryColor,
        ),
        title: Text(
          title,
        ),
        titleTextStyle: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(color: ColorManager.hintTextColor, fontSize: 18.0),
        trailing: Radio(
            value: value,
            groupValue: 0,
            fillColor: WidgetStateProperty.all(ColorManager.primaryColor),
            onChanged: (value) {}),
      ),
    );
  }
}
