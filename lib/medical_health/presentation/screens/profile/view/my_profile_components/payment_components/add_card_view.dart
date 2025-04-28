import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/payment_components/card_info.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/payment_components/card_section.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/header.dart';

class AddCardView extends StatelessWidget {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                title: 'Add Card',
                onTap: () {
                  GoRouter.of(context).pop();
                },
              ),
              CardSection(),
              CardInfo()
            ],
          ),
        ),
      )),
    );
  }
}
