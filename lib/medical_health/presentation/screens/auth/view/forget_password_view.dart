import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_form_field.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/header.dart';



class ForgetPasswordView extends StatelessWidget {
   ForgetPasswordView({super.key});

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Header(title: 'Set Password'),
              ),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: ColorManager.textBlack2Color,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 30,),
              Text('Password',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              CustomTextFormField(
                  text: '*************',
                  type: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                    },
                    icon: Icon( Icons.visibility_outlined,
                      size:16,
                    ),
                    color:ColorManager.textBlackColor,
                  ),
                  textEditingController: passwordController),
              SizedBox(height: 10,),
              Text('Confirm Password',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              CustomTextFormField(
                  text: '*************',
                  type: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                    },
                    icon: Icon( Icons.visibility_outlined,
                      size:16,
                    ),
                    color:ColorManager.textBlackColor,
                  ),
                  textEditingController: confirmPasswordController),
              SizedBox(height: 20.0,),
              Center(
                child: CustomTextButton(
                  onPressed: (){
                  },
                  text: 'Create new password',
                  upperCase: false,
                  fontColor: ColorManager.whiteColor,
                  fontSize: 20,
                  borderRadius: BorderRadius.circular(30),
                  width: 300,

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
