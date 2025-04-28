import 'package:hive_flutter/hive_flutter.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';

part 'doctor_model.g.dart';

@HiveType(typeId: 1)
class DoctorModel extends DoctorEntity {
  @override
  @HiveField(0)
  String get docName => super.docName;

  @override
  @HiveField(1)
  String get docProfile => super.docProfile;

  @override
  @HiveField(2)
  String get  medicalSpecialization => super.medicalSpecialization;

  @override
  @HiveField(3)
  num get docRate => super.docRate;

  @override
  @HiveField(4)
  String get gender => super.gender;

  @override
  @HiveField(5)
  num get chatNum => super.chatNum;

  @override
  @HiveField(6)
  String get docId => super.docId;

  const DoctorModel({
    required super.docName,
    required super.docProfile,
    required super.medicalSpecialization,
    required super.docRate,
    required super.gender,
    required super.chatNum,
    required super.docId,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      docName: json['doc_name'],
      docProfile: json['doc_profile'],
      medicalSpecialization: json['medical_specialization'],
      docRate: json['doc_rate'],
      gender: json['gender'],
      chatNum: json['chat_num'],
      docId: json['doc_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'doc_name': docName,
      'doc_profile': docProfile,
      'medical_specialization': medicalSpecialization,
      'doc_rate': docRate,
      'gender': gender,
      'chat_num': chatNum,
      'doc_id': docId,
    };
  }
}