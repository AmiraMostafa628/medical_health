import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/core/services/validation_service.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/auth/view_model/auth_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/auth/view_model/auth_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/auth/view_model/auth_state.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_form_field.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/header.dart';


class SignUpView extends StatelessWidget {
   SignUpView({super.key});

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final dateController = TextEditingController();

   final formKey=GlobalKey<FormState>();
   final List<IconData> loginMethod=[
     FontAwesomeIcons.google,
     FontAwesomeIcons.facebookF,
     FontAwesomeIcons.fingerprint,
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthBloc,AuthStates>(
          builder: (context,state) {
            dateController.text = state.date;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Header(title: 'New Account'),
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
                      Text('Password',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      CustomTextFormField(
                      text: '*************',
                      type: TextInputType.visiblePassword,
                      validate: (value){
                        return ValidationService.isPasswordValid(value);
                      },
                      isPassword: state.obscureText,
                      suffixIcon: IconButton(
                            onPressed: () {
                              AuthBloc.get(context).add(ChangePasswordVisibilityEvent(
                                  obscureText: state.obscureText));
                            },
                            icon: Icon(
                              state.obscureText
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              size:16,
                            ),
                            color:ColorManager.textBlackColor,
                          ),
                      textEditingController: passwordController),
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
                      Text('Date of birth',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      CustomTextFormField(
                          text: 'DD / MM /YYY',
                          type: TextInputType.phone,
                          readOnly: true,
                          onTap: () async {
                            AuthBloc.get(context).add(ShowDatePickerEvent(context: context));

                          },
                          validate: (value){
                            if(value == null){
                              return 'Wrong Date';

                            }
                            return null;
                          },
                          textEditingController: dateController),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'By continuing, you agree to \n',
                                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                  fontWeight: FontWeight.w200,
                                  color: ColorManager.textBlack2Color,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Terms of Use ',
                                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                        fontWeight: FontWeight.w200,
                                      )

                                  ),
                                  TextSpan(
                                      text: 'and ',
                                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                        fontWeight: FontWeight.w200,
                                        color: ColorManager.textBlack2Color,
                                      )

                                  ),
                                  TextSpan(
                                      text: 'Privacy Policy.',
                                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                        fontWeight: FontWeight.w200,
                                      )

                                  )
                                ]

                              )),
                        ),
                      ),
                      Center(
                        child: CustomTextButton(
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              AuthBloc.get(context).add(
                                  SignUpEvent(
                                    name: nameController.text,
                                    email: emailController.text,
                                    mobileNumber: mobileController.text,
                                    dateOfBirth: dateController.text,
                                    password: passwordController.text,
                                  ));
                            }
                          },
                          text: 'Sign Up',
                          upperCase: false,
                          fontColor: ColorManager.whiteColor,
                          fontSize: 24,
                          borderRadius: BorderRadius.circular(30),
                          width: 250,

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Center(
                          child: Text('or sign up with',
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                fontWeight: FontWeight.w300,
                                color: ColorManager.textBlack2Color
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: loginMethod.map((item){
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: ColorManager.lightPrimaryColor,
                              child: Icon(item,color: ColorManager.primaryColor,),
                            ),
                          );
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('already have an account?',
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                fontWeight: FontWeight.w300,
                                color: ColorManager.textBlack2Color
                            ),
                          ),
                          TextButton(
                              onPressed: (){
                                GoRouter.of(context).push(AppRouter.kLoginView);
                              },
                              child: Text('Log in',
                                style: TextTheme.of(context).labelSmall!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ))
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
