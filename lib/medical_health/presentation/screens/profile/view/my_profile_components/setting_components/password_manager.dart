import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_form_field.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/header.dart';


class PasswordManager extends StatelessWidget {
  PasswordManager({super.key});

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Header(title: 'Password Manager'),
              ),
              Text(
                'Current Password',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              CustomTextFormField(
                  text: '*************',
                  type: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility_outlined,
                      size: 16,
                    ),
                    color: ColorManager.textBlackColor,
                  ),
                  textEditingController: currentPasswordController),
              SizedBox(
                height: 10,
              ),
              Text(
                'New Password',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              CustomTextFormField(
                  text: '*************',
                  type: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility_outlined,
                      size: 16,
                    ),
                    color: ColorManager.textBlackColor,
                  ),
                  textEditingController: newPasswordController),
              SizedBox(
                height: 10,
              ),
              Text(
                'Confirm New Password',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              CustomTextFormField(
                  text: '*************',
                  type: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility_outlined,
                      size: 16,
                    ),
                    color: ColorManager.textBlackColor,
                  ),
                  textEditingController: confirmNewPasswordController),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomTextButton(
                    onPressed: () {},
                    text: 'Change Password',
                    upperCase: false,
                    fontColor: ColorManager.whiteColor,
                    fontSize: 20,
                    borderRadius: BorderRadius.circular(30),
                    width: 300,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
