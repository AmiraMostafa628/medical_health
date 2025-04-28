import 'package:dartz/dartz.dart';
import 'package:medical_health_clean_arch/core/error/failure.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/doctor_model.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/login_model.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/message_model.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/sign_up_model.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/message_entity.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/user_entity.dart';

abstract class BaseRepository{
  Future<Either<Failure,UserEntity>> login(LoginModel loginModel);

  Future<Either<Failure,UserEntity>> signUp(SignUpModel signUpModel);

  Future<Either<Failure,List<DoctorEntity>>> fetchDoctorsData();

  Future<Either<Failure,void>> addFavDoctors(DoctorModel doctorModel);

  Future<Either<Failure,void>> deleteFavDoctors(DoctorModel doctorModel);

  Future<Either<Failure,List<DoctorEntity>>> fetchFavDoctorsData();

  Future<Either<Failure,void>> sendMessage(MessageModel message);

  Future<Either<Failure,List<MessageEntity>>> fetchMessage(String docId);

}