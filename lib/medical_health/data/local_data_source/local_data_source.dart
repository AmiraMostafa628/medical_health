import 'package:medical_health_clean_arch/core/services/user_doctor_storage.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/doctor_model.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/user_model.dart';

abstract class BaseLocalDataSource{
  Future<void> saveUserModel(UserModel model);
  Future<UserModel?> getUserModel();
  Future<void> saveListOfDoctorModel(List<DoctorModel> model);
  Future<List<DoctorModel>?> getDoctorsModel({required String key});
}

class LocalDataSourceImpl extends BaseLocalDataSource {
  @override
  Future<void> saveUserModel(UserModel model) async {
    await UserDoctorStorageHelper.saveUserModel(model);
  }

  @override
  Future<UserModel?> getUserModel() async {
    return UserDoctorStorageHelper.getUserModel();
  }

  @override
  Future<void> saveListOfDoctorModel(List<DoctorModel> model) async {
    await UserDoctorStorageHelper.saveListOfDoctorModel(model);
  }

  @override
  Future<List<DoctorModel>?> getDoctorsModel({required String key}) async {
    return UserDoctorStorageHelper.getDoctorsModel(key);
  }
}
