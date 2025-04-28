import 'package:hive_flutter/hive_flutter.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/doctor_model.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/user_model.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/app_constance.dart';


class UserDoctorStorageHelper {
  static late Box<UserModel> userBox;
  static late Box<List<DoctorModel>> doctorBox;

  static Future<void> initHive() async {
    userBox = await Hive.openBox<UserModel>('userBox');
    doctorBox = await Hive.openBox<List<DoctorModel>>('doctorBox');
  }

  static Future<void> saveUserModel(UserModel model) async {
    await userBox.put(AppConstance.userModelKey, model);
  }

  static UserModel? getUserModel() {
    return userBox.get(AppConstance.userModelKey);
  }

  static Future<void> saveListOfDoctorModel(List<DoctorModel> model) async {
    await doctorBox.put(AppConstance.doctorsListKey, model);

    List<DoctorModel> sortedDoctorsModel = List.from(model);
    sortedDoctorsModel.sort((a, b) => a.docName.compareTo(b.docName));
    await doctorBox.put(AppConstance.sortedDoctorListKey, sortedDoctorsModel);
  }

  static List<DoctorModel>? getDoctorsModel(String key) {
    return doctorBox.get(key);
  }
}
