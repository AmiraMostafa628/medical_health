import 'package:dartz/dartz.dart';
import 'package:medical_health_clean_arch/core/base_use_case/base_use_case.dart';
import 'package:medical_health_clean_arch/core/error/failure.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/sign_up_model.dart';
import 'package:medical_health_clean_arch/medical_health/domain/base_repository/base_repository.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/user_entity.dart';

class SignUpUseCase extends BaseUseCase<UserEntity,SignUpModel>{
  final BaseRepository baseRepository;

  SignUpUseCase({
    required this.baseRepository,
  });

  @override
  Future<Either<Failure, UserEntity>> execute(SignUpModel param) async{
    return await baseRepository.signUp(param);
  }

}