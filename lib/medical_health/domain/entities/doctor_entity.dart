import 'package:equatable/equatable.dart';

class DoctorEntity extends Equatable {
  final String docName;
  final String docProfile;
  final String medicalSpecialization;
  final num docRate;
  final String gender;
  final num chatNum;
  final String docId;

  const DoctorEntity({
   required this.docName,
   required this.docProfile,
   required this.medicalSpecialization,
   required this.docRate,
   required this.gender,
   required this.chatNum,
   required this.docId,
  });

  @override
  List<Object?> get props => [
    docName,
    docProfile,
    medicalSpecialization,
    docRate,
    gender,
    chatNum,
    docId,
  ];
}