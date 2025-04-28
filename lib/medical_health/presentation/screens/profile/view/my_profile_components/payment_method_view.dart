import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/payment_components/credit_section.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/payment_components/more_payment_option.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/header.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          spacing: 30.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                title: 'Payment Method'),
            CreditSection(),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: MorePaymentOption(),
            ),


          ],
        ),
      )),
    );
  }
}
