import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_health_clean_arch/core/error/exception.dart';
import 'package:medical_health_clean_arch/core/network/error_message_model.dart';
import 'package:medical_health_clean_arch/core/services/cache_helper.dart';
import 'package:medical_health_clean_arch/core/shared_function/initial_orders.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/doctor_model.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/login_model.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/message_model.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/sign_up_model.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/user_model.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/app_constance.dart';

abstract class BaseRemoteDataSource {
  Future<UserModel> login({required LoginModel loginModel});

  Future<UserModel> signUp({required SignUpModel signUpModel});

  Future<List<DoctorModel>> fetchDoctorsData();

  Future<void> addFavDoctors({required DoctorModel doctor});

  Future<void> deleteFavDoctors({required DoctorModel doctor});

  Future<List<DoctorModel>> getFavDoctors();

  Future<void> sendMessage({
    required MessageModel message,
  });

  Stream<List<MessageModel>> getMessage({
    required String docId,
  });
}

class RemoteDataSourceImpl extends BaseRemoteDataSource {
  @override
  Future<UserModel> login({required LoginModel loginModel}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: loginModel.email, password: loginModel.password);

      if (!userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification();
        throw VerificationException(
            message: 'Email not verified, verification sent!');
      }

      final result = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (!result.exists) {
        throw ServerException(
            errorMessageModel:
                ErrorMessageModel(statusMessage: "user not found"));
      }

      return UserModel.fromJson(result.data()!);
    } on FirebaseAuthException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
        statusMessage: error.code,
      ));
    }
  }

  @override
  Future<UserModel> signUp({required SignUpModel signUpModel}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUpModel.email,
        password: signUpModel.password,
      );

      if (userCredential.user != null && !userCredential.user!.emailVerified) {
        User? user = FirebaseAuth.instance.currentUser;
        await user!.sendEmailVerification();
      }

      UserModel userModel = UserModel(
          name: signUpModel.name,
          email: signUpModel.email,
          uId: userCredential.user!.uid,
          mobileNumber: signUpModel.mobileNumber,
          dateOfBirth: signUpModel.dateOfBirth);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userModel.uId)
          .set(userModel.toJson());

      return userModel;
    } on FirebaseAuthException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
        statusMessage: error.code,
      ));
    }
  }

  @override
  Future<List<DoctorModel>> fetchDoctorsData() async {
    try {
      late List<DoctorModel> doctorsList;
      uId = await CacheHelper.getData(key: AppConstance.uIdKey);
      final result =
          await FirebaseFirestore.instance.collection('doctors').get();

      doctorsList = result.docs
          .map(
            (e) => DoctorModel.fromJson(e.data()),
          )
          .toList();

      return doctorsList;
    } on FirebaseException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
        statusMessage: error.code,
      ));
    }
  }

  @override
  Future<void> addFavDoctors({required DoctorModel doctor}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('favourite')
          .doc(doctor.docId)
          .set(doctor.toMap());
    } on FirebaseException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
        statusMessage: error.code,
      ));
    }
  }

  @override
  Future<void> deleteFavDoctors({required DoctorModel doctor}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('favourite')
          .doc(doctor.docId)
          .delete();
    } on FirebaseException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
        statusMessage: error.code,
      ));
    }
  }

  @override
  Future<List<DoctorModel>> getFavDoctors() async {
    try {
      late List<DoctorModel> favDoctorsList;
      final result = await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('favourite')
          .get();

      favDoctorsList = result.docs
          .map(
            (e) => DoctorModel.fromJson(e.data()),
          )
          .toList();

      return favDoctorsList;
    } on FirebaseException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
        statusMessage: error.code,
      ));
    }
  }

  @override
  Future<void> sendMessage({
    required MessageModel message,
  }) async {
    try {
      // set receiver chat
      await FirebaseFirestore.instance
          .collection('doctors')
          .doc(message.receiverId)
          .collection('chats')
          .doc(uId)
          .collection('messages')
          .add(message.toMap()!);
      // set my chats
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('chats')
          .doc(message.receiverId)
          .collection('messages')
          .add(message.toMap()!);
    } on FirebaseException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
        statusMessage: error.code,
      ));
    }
  }

  @override
  Stream<List<MessageModel>> getMessage({
    required String docId,
  }) async* {
    try {
      final result = FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('chats')
          .doc(docId)
          .collection('messages')
          .orderBy('dateTime')
          .snapshots();

      await for (final snapshot in result) {
        yield snapshot.docs
            .map((doc) => MessageModel.fromJson(doc.data()))
            .toList();
      }
    } on FirebaseException catch (error) {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
        statusMessage: error.code,
      ));
    }
  }
}
