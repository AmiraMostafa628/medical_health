import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/payment_components/payment_widget.dart';

class CreditSection extends StatelessWidget {
  const CreditSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Credit & Debit Card',
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontSize: 20.0),
        ),
        GestureDetector(
          onTap: (){
            GoRouter.of(context).push(AppRouter.kAddCardView);
          },
          child: PaymentWidget(
            value: 0,
            title: 'Add New Card',
            icon:  Icons.credit_card,
          ),
        ),
      ],
    );
  }
}
