import 'package:dartz/dartz.dart';
import 'package:medical_health_clean_arch/core/base_use_case/base_use_case.dart';
import 'package:medical_health_clean_arch/core/error/failure.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/login_model.dart';
import 'package:medical_health_clean_arch/medical_health/domain/base_repository/base_repository.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/user_entity.dart';

class LoginUseCase extends BaseUseCase<UserEntity,LoginModel>{
  final BaseRepository baseRepository;

  LoginUseCase({
    required this.baseRepository,
  });

  @override
  Future<Either<Failure, UserEntity>> execute(LoginModel param) async{
  return await baseRepository.login(param);
  }

}
