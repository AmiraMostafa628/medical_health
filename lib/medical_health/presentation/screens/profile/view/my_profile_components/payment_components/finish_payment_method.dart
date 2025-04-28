import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/payment_components/doctor_appointment.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/payment_components/finish_payment_header.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/payment_components/finish_payment_info.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';

class FinishPaymentMethod extends StatelessWidget {
  const FinishPaymentMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FinishPaymentHeader(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DoctorAppointment(),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FinishPaymentInfo(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: CustomTextButton(
                  text: 'Pay Now',
                  upperCase: false,
                  height: 50,
                  borderRadius: BorderRadius.circular(30.0),
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kCongratulationView);

                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
