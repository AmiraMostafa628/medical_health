import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/core/services/validation_service.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/assets_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_states.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_form_field.dart';


class EditProfileView extends StatelessWidget {
   EditProfileView({super.key});
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<ProfileBloc,ProfileStates>(
            builder: (context,state) {
              return SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            GoRouter.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: ColorManager.primaryColor,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text('Profile',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(AssetsManager.profile),
                          ),
                          Positioned(
                            bottom: 10,
                            child: CircleAvatar(
                              radius: 12,
                              child: Icon(Icons.edit,size: 18,),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text('Full Name',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    CustomTextFormField(
                        text: 'John doe',
                        type: TextInputType.text,
                        validate: (value){
                          return ValidationService.isUserNameValid(value);
                        },
                        textEditingController: nameController),
                    Text('Mobile Number',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    CustomTextFormField(
                        text: '01234567891',
                        type: TextInputType.phone,
                        validate: (value){
                          return ValidationService.isMobileNumberValid(value);
                        },
                        textEditingController: mobileController),
                    Text('Email',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    CustomTextFormField(
                        text: 'example@example.com',
                        type: TextInputType.emailAddress,
                        validate: (value){
                          return ValidationService.isEmailValid(value);
                        },
                        textEditingController: emailController),
                    Text('Date of birth',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    CustomTextFormField(
                        text: 'DD / MM /YYY',
                        type: TextInputType.phone,
                        readOnly: true,
                        onTap: () async {
                          ProfileBloc.get(context).add(ShowDatePickerEditProfileEvent(context: context));
                
                        },
                        validate: (value){
                          if(value == null){
                            return 'Wrong Date';
                
                          }
                          return null;
                        },
                        textEditingController: dateController),
                    SizedBox(height: 20,),
                    Center(
                      child: CustomTextButton(
                        onPressed: (){},
                        text: 'Update Profile',
                        upperCase: false,
                        fontColor: ColorManager.whiteColor,
                        fontSize: 24,
                        borderRadius: BorderRadius.circular(30),
                        width: 250,
                
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
