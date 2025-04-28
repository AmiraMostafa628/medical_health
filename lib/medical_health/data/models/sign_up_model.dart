import 'package:equatable/equatable.dart';

class SignUpModel extends Equatable {
  final String name;
  final String email;
  final String password;
  final String mobileNumber;
  final String dateOfBirth;

  const SignUpModel({
    required this.name,
    required this.email,
    required this.password,
    required this.mobileNumber,
    required this.dateOfBirth,
  });



  @override
  List<Object?> get props => [
        name,
        email,
        password,
        mobileNumber,
        dateOfBirth,
      ];
}
