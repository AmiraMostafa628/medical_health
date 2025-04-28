import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/help_components/contact_us_section.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/help_components/faq_section.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_states.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';


class HelpViewBody extends StatelessWidget {
   HelpViewBody({super.key});

  final List<Widget> helpViewBodySection = [
    FaqSection(),
    ContactUsSection(),

  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileStates>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
              spacing: 15.0,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      ProfileBloc.get(context)
                          .add(ChangeHelpBodyIndexEvent(index: 0));
                    },
                    child: CustomTextButton(
                      text: 'FAQ',
                      height: 50,
                      upperCase: false,
                      fontColor: state.selectedHelpBodyIndexIndex == 0
                          ? ColorManager.whiteColor
                          : ColorManager.primaryColor,
                      backGroundColor: state.selectedHelpBodyIndexIndex == 0
                          ? ColorManager.primaryColor
                          : ColorManager.lightPrimaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      ProfileBloc.get(context)
                          .add(ChangeHelpBodyIndexEvent(index: 1));
                    },
                    child: CustomTextButton(
                      text: 'Contact Us',
                      borderRadius: BorderRadius.circular(30),
                      height: 50,
                      upperCase: false,
                      fontColor: state.selectedHelpBodyIndexIndex == 1
                          ? ColorManager.whiteColor
                          : ColorManager.primaryColor,
                      backGroundColor: state.selectedHelpBodyIndexIndex == 1
                          ? ColorManager.primaryColor
                          : ColorManager.lightPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            helpViewBodySection[state.selectedHelpBodyIndexIndex],
          ],
        ),
      );
    });
  }
}
