import 'package:dartz/dartz.dart';
import 'package:medical_health_clean_arch/core/base_use_case/base_use_case.dart';
import 'package:medical_health_clean_arch/core/error/failure.dart';
import 'package:medical_health_clean_arch/medical_health/domain/base_repository/base_repository.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';

class FetchDoctorsDataUseCase extends BaseUseCase<List<DoctorEntity>, void> {
  final BaseRepository baseRepository;

  FetchDoctorsDataUseCase({
    required this.baseRepository,
  });


  @override
  Future<Either<Failure, List<DoctorEntity>>> execute(void param) async {
    return await baseRepository.fetchDoctorsData();
  }


}

class FilterDoctorsUseCase{

  List<DoctorEntity> filterByGender(List<DoctorEntity> doctors, String gender) {
    return doctors.where((doctor) => doctor.gender == gender).toList();
  }

  List<DoctorEntity> sortByRating(List<DoctorEntity> doctors) {
    final sortedRatingList = List<DoctorEntity>.from(doctors);
    sortedRatingList.sort((a, b) => b.docRate.compareTo(a.docRate));
    return sortedRatingList;
  }

}
