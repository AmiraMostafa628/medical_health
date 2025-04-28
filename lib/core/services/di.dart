import 'package:get_it/get_it.dart';
import 'package:medical_health_clean_arch/medical_health/data/local_data_source/local_data_source.dart';
import 'package:medical_health_clean_arch/medical_health/data/remote_data_source/remote_data_source.dart';
import 'package:medical_health_clean_arch/medical_health/data/repo_impl/repository_impl.dart';
import 'package:medical_health_clean_arch/medical_health/domain/base_repository/base_repository.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/auth_use_case/login_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/auth_use_case/sign_up_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/fetch_doctors_use_cases/add_fav_doctors_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/fetch_doctors_use_cases/delete_fav_doctors_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/fetch_doctors_use_cases/fetch_doctors_data_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/fetch_doctors_use_cases/get_favorites_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/messages_use_case/fetch_messages_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/messages_use_case/send_message_use_case.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {


  instance.registerLazySingleton<BaseLocalDataSource>(
    () => LocalDataSourceImpl(),
  );

  instance.registerLazySingleton<BaseRemoteDataSource>(
    () => RemoteDataSourceImpl(),
  );

  instance.registerLazySingleton<BaseRepository>(
    () => RepositoryImpl(
      baseRemoteDataSource: instance(),
      localDataSource: instance(),
    ),
  );

  instance.registerFactory<LoginUseCase>(
    () => LoginUseCase(
      baseRepository: instance(),
    ),
  );

  instance.registerFactory<SignUpUseCase>(
    () => SignUpUseCase(
      baseRepository: instance(),
    ),
  );

  instance.registerFactory<FetchDoctorsDataUseCase>(
        () => FetchDoctorsDataUseCase(
      baseRepository: instance(),
    ),
  );

  instance.registerFactory<FetchFavDoctorsDataUseCase>(
        () => FetchFavDoctorsDataUseCase(
      baseRepository: instance(),
    ),
  );

  instance.registerFactory<AddFavDoctorsDataUseCase>(
        () => AddFavDoctorsDataUseCase(
      baseRepository: instance(),
    ),
  );

  instance.registerFactory<DeleteFavDoctorsDataUseCase>(
        () => DeleteFavDoctorsDataUseCase(
      baseRepository: instance(),
    ),
  );

  instance.registerFactory<SendMessageUseCase>(
        () => SendMessageUseCase(
      baseRepository: instance(),
    ),
  );

  instance.registerFactory<FetchMessagesUseCase>(
        () => FetchMessagesUseCase(
      baseRepository: instance(),
    ),
  );
}
