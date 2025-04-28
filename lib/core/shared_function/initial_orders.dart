import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medical_health_clean_arch/core/services/bloc_observer.dart';
import 'package:medical_health_clean_arch/core/services/cache_helper.dart';
import 'package:medical_health_clean_arch/core/services/di.dart';
import 'package:medical_health_clean_arch/core/services/user_doctor_storage.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/doctor_model.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/user_model.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/app_constance.dart';

var uId = '';
late UserModel model;
late List<DoctorEntity> doctorsModel;
late List<DoctorEntity> sortedDoctorModel;
late bool isLoggedIn;

Future<bool> getInitialOrders() async {
  await initAppModule();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(DoctorModelAdapter());
  await UserDoctorStorageHelper.initHive();

  isLoggedIn = CacheHelper.getData(key: AppConstance.loginKey) ?? false;


  return isLoggedIn;
}
