import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/app_constance.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/auth/view_model/auth_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/auth/view_model/auth_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/auth/view_model/auth_state.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_form_field.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/header.dart';
import 'package:medical_health_clean_arch/core/services/validation_service.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<IconData> loginMethod = [
    FontAwesomeIcons.google,
    FontAwesomeIcons.facebookF,
    FontAwesomeIcons.fingerprint,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthStates>(listener: (context, state) {
          if (state.status == StatusType.success) {
            HomeBloc.get(context).add(HomeFetchDataEvent());
            GoRouter.of(context).push(AppRouter.kHomeView);
          }
        }, builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Header(title: 'Log In'),
                    ),
                    Text(
                      'Welcome',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: ColorManager.textBlack2Color,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Email or Mobile Number',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    CustomTextFormField(
                        text: 'example@example.com',
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          return ValidationService.isEmailValid(value);
                        },
                        textEditingController: emailController),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Password',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    CustomTextFormField(
                        text: '*************',
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          return ValidationService.isPasswordValid(value);
                        },
                        isPassword: state.obscureText,
                        suffixIcon: IconButton(
                          onPressed: () {
                            AuthBloc.get(context)
                                .add(ChangePasswordVisibilityEvent(
                              obscureText: state.obscureText,
                            ));
                          },
                          icon: Icon(
                            state.obscureText
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 16,
                          ),
                          color: ColorManager.textBlackColor,
                        ),
                        textEditingController: passwordController),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: SizedBox(
                        height: 35,
                        child: TextButton(
                            onPressed: () {
                              GoRouter.of(context)
                                  .push(AppRouter.kForgetPasswordView);
                            },
                            child: Text(
                              'Forget Password',
                              style: Theme.of(context).textTheme.labelSmall,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: CustomTextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            AuthBloc.get(context).add(LoginEvent(
                              email: emailController.text,
                              password: passwordController.text,
                            ));
                          }
                        },
                        text: 'Log In',
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
                        child: Text(
                          'or sign up with',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: ColorManager.textBlack2Color),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: loginMethod.map((item) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: ColorManager.lightPrimaryColor,
                            child: Icon(
                              item,
                              color: ColorManager.primaryColor,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: ColorManager.textBlack2Color),
                        ),
                        TextButton(
                            onPressed: () {
                              GoRouter.of(context).push(AppRouter.kSignUpView);
                            },
                            child: Text(
                              'Sign Up',
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
        }),
      ),
    );
  }
}
