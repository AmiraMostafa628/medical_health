import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view/add_cancel_review.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view/review_appointment.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/auth/view/forget_password_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/auth/view/login_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/auth/view/sign_up_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/chat/view/chat_view_body.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/home_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/home_view_components/home_fav_doctors.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/notifications_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/edit_profile_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/help_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/payment_components/add_card_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/payment_components/congratulation_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/payment_components/finish_payment_method.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/payment_method_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/privacy_policy_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/setting_components/notification_setting.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/setting_components/password_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/setting_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view/schedule_doctor.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view/schedule_doctor_components/schedule_appointment.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view/schedule_view_body.dart';

abstract class AppRouter {
  static const kOnboardingViewBody = '/onboardingViewBody';
  static const kLoginView = '/loginView';
  static const kSignUpView = '/SignUpView';
  static const kForgetPasswordView = '/forgetPasswordView';
  static const kHomeView = '/homeView';
  static const kDoctorsView = '/doctorsView';
  static const kFavView = '/favView';
  static const kSettingView = '/settingView';
  static const kEditProfileView = '/editProfileView';
  static const kPrivacyPolicyView = '/privacyPolicyView';
  static const kNotificationSetting = '/notificationSetting';
  static const kPasswordManager = '/passwordManager';
  static const kNotificationsView = '/notificationsView';
  static const kChatViewBody = '/chatViewBody';
  static const kHelpView = '/helpView';
  static const kScheduleViewBody = '/scheduleViewBody';
  static const kScheduleDoctor = '/scheduleDoctor';
  static const kScheduleAppointment = '/scheduleAppointment';
  static const kAddCancelReview = '/addCancelReview';
  static const kReviewAppointment = '/reviewAppointment';
  static const kPaymentMethodView = '/paymentMethodView';
  static const kAddCardView = '/addCardView';
  static const kFinishPaymentMethod = '/finishPaymentMethod';
  static const kCongratulationView = '/congratulationView';

  static GoRouter createRouter(Widget startWidget) {
    return GoRouter(routes: [
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return startWidget;
          }),
      GoRoute(
          path: '/loginView',
          builder: (BuildContext context, GoRouterState state) {
            return LoginView();
          }),
      GoRoute(
          path: '/SignUpView',
          builder: (BuildContext context, GoRouterState state) {
            return SignUpView();
          }),
      GoRoute(
          path: '/forgetPasswordView',
          builder: (BuildContext context, GoRouterState state) {
            return ForgetPasswordView();
          }),
      GoRoute(
          path: '/homeView',
          builder: (BuildContext context, GoRouterState state) {
            return HomeView();
          }),
      GoRoute(
          path: '/doctorsView',
          builder: (BuildContext context, GoRouterState state) {
            return DoctorsView();
          }),
      GoRoute(
          path: '/favView',
          builder: (BuildContext context, GoRouterState state) {
            return HomeFavDoctors();
          }),
      GoRoute(
          path: '/settingView',
          builder: (BuildContext context, GoRouterState state) {
            return SettingView();
          }),
      GoRoute(
          path: '/editProfileView',
          builder: (BuildContext context, GoRouterState state) {
            return EditProfileView();
          }),
      GoRoute(
          path: '/privacyPolicyView',
          builder: (BuildContext context, GoRouterState state) {
            return PrivacyPolicyView();
          }),
      GoRoute(
          path: '/notificationSetting',
          builder: (BuildContext context, GoRouterState state) {
            return NotificationSetting();
          }),
      GoRoute(
          path: '/passwordManager',
          builder: (BuildContext context, GoRouterState state) {
            return PasswordManager();
          }),
      GoRoute(
          path: '/notificationsView',
          builder: (BuildContext context, GoRouterState state) {
            return NotificationsView();
          }),
      GoRoute(
          path: '/chatViewBody',
          builder: (BuildContext context, GoRouterState state) {
            return ChatViewBody(
              doctorModel: state.extra as DoctorEntity,
            );
          }),
      GoRoute(
          path: '/helpView',
          builder: (BuildContext context, GoRouterState state) {
            return HelpView();
          }),
      GoRoute(
          path: '/scheduleViewBody',
          builder: (BuildContext context, GoRouterState state) {
            return ScheduleViewBody(
              doctorModel: state.extra as DoctorEntity,
            );
          }),
      GoRoute(
          path: '/scheduleDoctor',
          builder: (BuildContext context, GoRouterState state) {
            return ScheduleDoctor(
              doctorModel: state.extra as DoctorEntity,
            );
          }),
      GoRoute(
          path: '/scheduleAppointment',
          builder: (BuildContext context, GoRouterState state) {
            final data = state.extra as Map<String, dynamic>;
            return ScheduleAppointment(
              doctorModel: data['doctorModel'] as DoctorEntity,
              time: data['time'] as String,
              selectedDate: data['selectedDate'] as Map<String, String>,
            );
          }),
      GoRoute(
          path: '/addCancelReview',
          builder: (BuildContext context, GoRouterState state) {
            return AddCancelReview();
          }),
      GoRoute(
          path: '/reviewAppointment',
          builder: (BuildContext context, GoRouterState state) {
            return ReviewAppointment(
              doctor: state.extra as DoctorEntity,
            );
          }),
      GoRoute(
          path: '/paymentMethodView',
          builder: (BuildContext context, GoRouterState state) {
            return PaymentMethodView();
          }),
      GoRoute(
          path: '/addCardView',
          builder: (BuildContext context, GoRouterState state) {
            return AddCardView();
          }),
      GoRoute(
          path: '/finishPaymentMethod',
          builder: (BuildContext context, GoRouterState state) {
            return FinishPaymentMethod();
          }),
      GoRoute(
          path: '/congratulationView',
          builder: (BuildContext context, GoRouterState state) {
            return CongratulationView();
          }),

    ]);
  }
}
