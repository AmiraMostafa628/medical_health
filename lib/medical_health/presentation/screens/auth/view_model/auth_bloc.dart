import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/login_model.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/sign_up_model.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/auth_use_case/login_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/auth_use_case/sign_up_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/app_constance.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/auth/view_model/auth_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/auth/view_model/auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  static AuthBloc get(context) => BlocProvider.of(context);
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  AuthBloc(
    this.loginUseCase,
    this.signUpUseCase,
  ) : super(AuthStates()) {
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ShowDatePickerEvent>(_showDatePicker);
    on<LoginEvent>(_login);
    on<SignUpEvent>(_signUp);
  }

  FutureOr<void> _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<AuthStates> emit,
  ) {
    emit(
      state.copyWith(
        obscureText: !event.obscureText,
      ),
    );
  }

  Future<void> _showDatePicker(
    ShowDatePickerEvent event,
    Emitter<AuthStates> emit,
  ) async {
    late String formattedDate = '';
    DateTime? pickedDate = await showDatePicker(
      context: event.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      formattedDate = DateFormat('dd/MM/yy').format(pickedDate);
    }
    emit(
      state.copyWith(date: formattedDate),
    );
  }

  Future<void> _login(
    LoginEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(
      state.copyWith(
        status: StatusType.loading,
      ),
    );
    final result = await loginUseCase.execute(
      LoginModel(
        email: event.email,
        password: event.password,
      ),
    );

    result.fold((failure) {
      emit(
        state.copyWith(
          status: StatusType.failure,
          errorMessage: failure.message,
        ),
      );
    }, (user) {
      emit(state.copyWith(
        status: StatusType.success,
        user: user,
      ));
    });
  }

  Future<void> _signUp(
    SignUpEvent event,
    Emitter<AuthStates> emit,
  ) async {
    emit(state.copyWith(status: StatusType.loading));
    final result = await signUpUseCase.execute(SignUpModel(
      name: event.name,
      email: event.email,
      password: event.password,
      mobileNumber: event.mobileNumber,
      dateOfBirth: event.dateOfBirth,
    ));

    result.fold((failure) {
      emit(
        state.copyWith(
          status: StatusType.failure,
          errorMessage: failure.message,
        ),
      );
    }, (user) {
      emit(state.copyWith(
        status: StatusType.success,
        user: user,
      ));
    });
  }
}
