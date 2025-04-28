import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_clean_arch/core/services/di.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/auth_use_case/login_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/auth_use_case/sign_up_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/fetch_doctors_use_cases/add_fav_doctors_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/fetch_doctors_use_cases/delete_fav_doctors_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/fetch_doctors_use_cases/fetch_doctors_data_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/fetch_doctors_use_cases/get_favorites_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/messages_use_case/fetch_messages_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/messages_use_case/send_message_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/theme_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view_model/all_appointment_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/auth/view_model/auth_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/chat/view_model/chat_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view_model/schedule_bloc.dart';

class MedicalHealthApp extends StatelessWidget {
  final Widget startWidget;

  const MedicalHealthApp({
    super.key,
    required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            instance.get<LoginUseCase>(),
            instance.get<SignUpUseCase>(),
          ),
        ),
        BlocProvider(
            create: (context) => HomeBloc(
                  instance.get<FetchDoctorsDataUseCase>(),
                  FilterDoctorsUseCase(),
                  instance.get<FetchFavDoctorsDataUseCase>(),
                  instance.get<AddFavDoctorsDataUseCase>(),
                  instance.get<DeleteFavDoctorsDataUseCase>(),
                )
                  ..add(HomeFetchDataEvent())
                  ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => ChatBloc(
            instance.get<SendMessageUseCase>(),
            instance.get<FetchMessagesUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => ScheduleBloc(),
        ),
        BlocProvider(
          create: (context) => AppointmentBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.createRouter(startWidget),
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(),
      ),
    );
  }
}
