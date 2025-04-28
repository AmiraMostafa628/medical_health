import 'package:equatable/equatable.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/app_constance.dart';

class HomeStates extends Equatable {
  final List<Map<String, String>>? datesAndDays;
  final int selectedWeekIndex;
  final int selectedIconIndex;
  final int selectedBottomNavbarIndex;
  final List<DoctorEntity>? favoriteDoctors;
  final int selectedFavoriteButtonIndex;
  final int selectMedicalSpecializationIndex;
  final DoctorEntity? doctorInfo;
  final StatusType status;
  final String? errorMessage;
  final List<DoctorEntity>? maleDoctorsList;
  final List<DoctorEntity>? femaleDoctorsList;
  final List<DoctorEntity>? ratingDoctorsList;

  const HomeStates(
      {this.datesAndDays,
      this.selectedWeekIndex = 0,
      this.selectedIconIndex = -1,
      this.selectedBottomNavbarIndex = 0,
      this.favoriteDoctors,
      this.selectedFavoriteButtonIndex = 0,
      this.selectMedicalSpecializationIndex = -1,
      this.doctorInfo,
      this.status = StatusType.initial,
      this.errorMessage,
      this.maleDoctorsList,
      this.femaleDoctorsList,
      this.ratingDoctorsList});

  HomeStates copyWith({
    List<Map<String, String>>? datesAndDays,
    int? selectedWeekIndex,
    int? selectedIconIndex,
    int? selectedBottomNavbarIndex,
    List<DoctorEntity>? favoriteDoctors,
    int? selectedFavoriteButtonIndex,
    int? selectMedicalSpecializationIndex,
    DoctorEntity? doctorInfo,
    dynamic date,
    StatusType? status,
    String? errorMessage,
    List<DoctorEntity>? maleDoctorsList,
    List<DoctorEntity>? femaleDoctorsList,
    List<DoctorEntity>? ratingDoctorsList,
  }) {
    return HomeStates(
      datesAndDays: datesAndDays ?? this.datesAndDays,
      selectedWeekIndex: selectedWeekIndex ?? this.selectedWeekIndex,
      selectedIconIndex: selectedIconIndex ?? this.selectedIconIndex,
      selectedBottomNavbarIndex:
          selectedBottomNavbarIndex ?? this.selectedBottomNavbarIndex,
      favoriteDoctors: favoriteDoctors ?? this.favoriteDoctors,
      selectedFavoriteButtonIndex:
          selectedFavoriteButtonIndex ?? this.selectedFavoriteButtonIndex,
      selectMedicalSpecializationIndex: selectMedicalSpecializationIndex ??
          this.selectMedicalSpecializationIndex,
      doctorInfo: doctorInfo ?? this.doctorInfo,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      maleDoctorsList: maleDoctorsList ?? this.maleDoctorsList,
      femaleDoctorsList: femaleDoctorsList ?? this.femaleDoctorsList,
      ratingDoctorsList: ratingDoctorsList ?? this.ratingDoctorsList,
    );
  }

  @override
  List<Object?> get props => [
        datesAndDays,
        selectedWeekIndex,
        selectedIconIndex,
        selectedBottomNavbarIndex,
        favoriteDoctors,
        selectedFavoriteButtonIndex,
        selectMedicalSpecializationIndex,
        doctorInfo,
        status,
        errorMessage,
        maleDoctorsList,
        femaleDoctorsList,
        ratingDoctorsList,
      ];
}
