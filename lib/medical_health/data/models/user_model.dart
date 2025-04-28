import 'package:hive_flutter/adapters.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/user_entity.dart';
part 'user_model.g.dart';


@HiveType(typeId: 0)
class UserModel extends UserEntity {
  @override
  @HiveField(0)
  String get name => super.name;

  @override
  @HiveField(1)
  String get email => super.email;

  @override
  @HiveField(2)
  String get uId => super.uId;

  @override
  @HiveField(3)
  String get mobileNumber => super.mobileNumber;

  @override
  @HiveField(4)
  String get dateOfBirth => super.dateOfBirth;

  const UserModel({
    required super.name,
    required super.email,
    required super.uId,
    required super.mobileNumber,
    required super.dateOfBirth,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
      mobileNumber: json['mobile_number'],
      dateOfBirth: json['date_of_birth'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'mobile_number': mobileNumber,
      'date_of_birth': dateOfBirth,
    };
  }
}


