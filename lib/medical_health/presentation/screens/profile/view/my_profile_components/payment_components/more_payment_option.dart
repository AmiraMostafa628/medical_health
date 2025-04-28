import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/payment_components/payment_widget.dart';

class MorePaymentOption extends StatelessWidget {
  const MorePaymentOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'More Payment Option',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontSize: 20.0),
        ),
        PaymentWidget(
          value: 1,
          title: 'Apple Play',
          icon: Icons.apple_outlined,
        ),
        PaymentWidget(
          value: 2,
          title: 'Paypal',
          icon: Icons.paypal_outlined,
        ),
        PaymentWidget(
          value: 3,
          title: 'Google Play',
          icon: FontAwesomeIcons.google,
        ),

      ],
    );
  }
}
