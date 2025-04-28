import 'package:dartz/dartz.dart';
import 'package:medical_health_clean_arch/core/base_use_case/base_use_case.dart';
import 'package:medical_health_clean_arch/core/error/failure.dart';
import 'package:medical_health_clean_arch/medical_health/domain/base_repository/base_repository.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';

class FetchFavDoctorsDataUseCase extends BaseUseCase<List<DoctorEntity>, void> {
  final BaseRepository baseRepository;

  FetchFavDoctorsDataUseCase({
    required this.baseRepository,
  });

  @override
  Future<Either<Failure, List<DoctorEntity>>> execute(void param) async{
    return await baseRepository.fetchFavDoctorsData();
  }
}