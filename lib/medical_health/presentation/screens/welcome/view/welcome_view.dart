import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/assets_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 15.0,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                AssetsManager.welcomeLogo,
                height: 140,
                width: 140,
              ),
              Text(
                'Skin\nFirts',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Dermatology center',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: ColorManager.textBlack2Color,
                      ),
                ),
              ),
              CustomTextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kLoginView);
                },
                text: 'Log In',
                upperCase: false,
                fontColor: ColorManager.whiteColor,
                fontSize: 24,
                borderRadius: BorderRadius.circular(30),
                width: 250,
              ),
              CustomTextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSignUpView);
                },
                text: 'Sign Up',
                upperCase: false,
                fontColor: ColorManager.primaryColor,
                fontSize: 24,
                backGroundColor: ColorManager.lightPrimaryColor,
                borderRadius: BorderRadius.circular(30),
                width: 250,
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
