// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoctorModelAdapter extends TypeAdapter<DoctorModel> {
  @override
  final int typeId = 1;

  @override
  DoctorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DoctorModel(
      docName: fields[0] as String,
      docProfile: fields[1] as String,
      medicalSpecialization: fields[2] as String,
      docRate: fields[3] as num,
      gender: fields[4] as String,
      chatNum: fields[5] as num,
      docId: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DoctorModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.docName)
      ..writeByte(1)
      ..write(obj.docProfile)
      ..writeByte(2)
      ..write(obj.medicalSpecialization)
      ..writeByte(3)
      ..write(obj.docRate)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.chatNum)
      ..writeByte(6)
      ..write(obj.docId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
