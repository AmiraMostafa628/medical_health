import 'package:medical_health_clean_arch/medical_health/data/models/doctor_model.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';

abstract class HomeEvent {}

class HomeFetchDataEvent extends HomeEvent {}

class AddFavoriteEvent extends HomeEvent {
  final DoctorEntity doctorModel;

  AddFavoriteEvent({
    required this.doctorModel,
  });
}

class GetFavoriteEvent extends HomeEvent {}

class DeleteFromFavoriteEvent extends HomeEvent {
  final DoctorEntity doctorModel;

  DeleteFromFavoriteEvent({
    required this.doctorModel,
  });
}

class SelectedDayEvent extends HomeEvent {
  final int index;

  SelectedDayEvent({
    required this.index,
  });
}

class ChangeIconEvent extends HomeEvent {
  final int index;
  final DoctorModel? doctorModel;

  ChangeIconEvent({
    required this.index,
    this.doctorModel,
  });
}

class ChangeBottomNavEvent extends HomeEvent {
  final int index;

  ChangeBottomNavEvent({
    required this.index,
  });
}

class ChangeFavoriteButtonEvent extends HomeEvent {
  final int index;

  ChangeFavoriteButtonEvent({
    required this.index,
  });
}

class SelectedDoctorInfoEvent extends HomeEvent {
  final DoctorEntity doctorModel;

  SelectedDoctorInfoEvent({
    required this.doctorModel,
  });
}

class ChangeMedicalSpecializationEvent extends HomeEvent {
  final int index;
  final int? isVisible;

  ChangeMedicalSpecializationEvent({
    required this.index,
    this.isVisible,
  });
}
