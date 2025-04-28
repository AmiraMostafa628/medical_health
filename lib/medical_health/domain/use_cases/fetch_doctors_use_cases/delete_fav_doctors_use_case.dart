import 'package:dartz/dartz.dart';
import 'package:medical_health_clean_arch/core/base_use_case/base_use_case.dart';
import 'package:medical_health_clean_arch/core/error/failure.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/doctor_model.dart';
import 'package:medical_health_clean_arch/medical_health/domain/base_repository/base_repository.dart';

class DeleteFavDoctorsDataUseCase extends BaseUseCase<void, DoctorModel> {
  final BaseRepository baseRepository;

  DeleteFavDoctorsDataUseCase({
    required this.baseRepository,
  });

  @override
  Future<Either<Failure, void>> execute(DoctorModel param) async{
    return await baseRepository.deleteFavDoctors(param);
  }
}