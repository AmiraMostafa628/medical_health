import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/help_components/help_view_body.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_form_field.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/header.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        spacing: 20.0,
        children: [
          IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.all(20.0),
              color: ColorManager.primaryColor,
              child: Column(
                spacing: 20.0,
                children: [
                  Header(
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                      color: ColorManager.whiteColor,
                      title: 'Help Center'),
                  Center(
                    child: Text(
                      'How Can We Help You?',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: ColorManager.lightBlueColor,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      text: 'Search...',
                      filledColor: ColorManager.whiteColor,
                      borderRadius: 30.0,
                      type: TextInputType.text,
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorManager.primaryColor,
                      ),
                      textEditingController: TextEditingController(),
                      suffixIcon: Icon(
                        Icons.mic,
                        size: 26,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          HelpViewBody(),
        ],
      )),
    );
  }
}
