import 'package:flutter/material.dart';

abstract class AuthEvents {}

class SignUpEvent extends AuthEvents {
  final String name;
  final String email;
  final String password;
  final String mobileNumber;
  final String dateOfBirth;

  SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.mobileNumber,
    required this.dateOfBirth,
  });
}

class LoginEvent extends AuthEvents {
  final String email;
  final String password;

  LoginEvent({
    required this.email,
    required this.password,
  });
}

class ChangePasswordVisibilityEvent extends AuthEvents {
  final bool obscureText;

  ChangePasswordVisibilityEvent({
    required this.obscureText,
  });
}

class ShowDatePickerEvent extends AuthEvents {
  final BuildContext context;

  ShowDatePickerEvent({
    required this.context,
  });
}

class ChangeRetypePasswordVisibilityEvent extends AuthEvents {}
