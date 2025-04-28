
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String name;
  final String email;
  final String uId;
  final String mobileNumber;
  final String dateOfBirth;

  const UserEntity({
   required this.name,
   required this.email,
   required this.uId,
   required this.mobileNumber,
   required this.dateOfBirth,
  });

  @override
  List<Object?> get props =>[
    name,
    email,
    uId,
    mobileNumber,
    dateOfBirth,
  ];
}