import 'package:equatable/equatable.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/user_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/app_constance.dart';


class AuthStates extends Equatable {
  final bool obscureText;
  final dynamic date;
  final StatusType status;
  final String? errorMessage;
  final UserEntity? user;

  const AuthStates({
    this.obscureText = true,
    this.date = '',
    this.status = StatusType.initial,
    this.errorMessage,
    this.user,
  });

  AuthStates copyWith({
    bool? obscureText,
    dynamic date,
    StatusType? status,
    String? errorMessage,
    UserEntity? user,
  }) {
    return AuthStates(
      obscureText: obscureText ?? this.obscureText,
      date: date ?? this.date,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
    obscureText,
    date,
    status,
    errorMessage,
    user,
  ];
}

