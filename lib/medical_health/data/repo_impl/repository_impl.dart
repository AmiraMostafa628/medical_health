import 'package:dartz/dartz.dart';
import 'package:medical_health_clean_arch/core/error/exception.dart';
import 'package:medical_health_clean_arch/core/error/failure.dart';
import 'package:medical_health_clean_arch/core/services/cache_helper.dart';
import 'package:medical_health_clean_arch/core/shared_function/initial_orders.dart';
import 'package:medical_health_clean_arch/medical_health/data/local_data_source/local_data_source.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/doctor_model.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/login_model.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/message_model.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/sign_up_model.dart';
import 'package:medical_health_clean_arch/medical_health/data/remote_data_source/remote_data_source.dart';
import 'package:medical_health_clean_arch/medical_health/domain/base_repository/base_repository.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/message_entity.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/user_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/app_constance.dart';

class RepositoryImpl extends BaseRepository {
  final BaseRemoteDataSource baseRemoteDataSource;
  final BaseLocalDataSource localDataSource;

  RepositoryImpl({
    required this.baseRemoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> login(LoginModel loginModel) async {
    try {
      final result = await baseRemoteDataSource.login(loginModel: loginModel);
      await localDataSource.saveUserModel(result);
      await CacheHelper.saveData(key: AppConstance.loginKey, value: true);
      await CacheHelper.saveData(key: AppConstance.uIdKey, value: result.uId);
      model = (await localDataSource.getUserModel())!;
      uId = await CacheHelper.getData(key: AppConstance.uIdKey);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(SignUpModel signUpModel) async {
    try {
      final result =
          await baseRemoteDataSource.signUp(signUpModel: signUpModel);
      await localDataSource.saveUserModel(result);
      await CacheHelper.saveData(key: AppConstance.loginKey, value: true);
      CacheHelper.saveData(key: AppConstance.uIdKey, value: result.uId);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> fetchDoctorsData() async {
    try {
      final result = await baseRemoteDataSource.fetchDoctorsData();
      await localDataSource.saveListOfDoctorModel(result);
      model = (await localDataSource.getUserModel())!;
      uId = await CacheHelper.getData(key: AppConstance.uIdKey);
      doctorsModel = (await localDataSource.getDoctorsModel(
          key: AppConstance.doctorsListKey))!;
      sortedDoctorModel = (await localDataSource.getDoctorsModel(
          key: AppConstance.sortedDoctorListKey))!;
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, void>> addFavDoctors(DoctorModel doctorModel) async {
    try {
      await baseRemoteDataSource.addFavDoctors(doctor: doctorModel);
      return Right(null);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteFavDoctors(
      DoctorModel doctorModel) async {
    try {
      await baseRemoteDataSource.deleteFavDoctors(doctor: doctorModel);
      return Right(null);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> fetchFavDoctorsData() async {
    try {
      final result = await baseRemoteDataSource.getFavDoctors();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, void>> sendMessage(MessageModel message) async {
    try {
      await baseRemoteDataSource.sendMessage(message: message);
      return Right(null);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<MessageEntity>>> fetchMessage(
      String docId) async {
    try {
      final stream = baseRemoteDataSource.getMessage(docId: docId);
      final List<MessageModel> result = await stream.first;

      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(message: failure.errorMessageModel.statusMessage),
      );
    }
  }
}
