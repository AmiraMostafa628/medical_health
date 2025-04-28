import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view_model/all_appointment_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view_model/all_appointment_states.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentStates> {
  static AppointmentBloc get(context) => BlocProvider.of(context);

  AppointmentBloc() : super(AppointmentStates()) {
    on<ChangeAppointmentTypeEvent>(_changeAppointmentIndex);
    on<ChangeAppointmentCancelReasonEvent>(_changeAppointmentCancelReason);
  }

  FutureOr<void> _changeAppointmentIndex(
    ChangeAppointmentTypeEvent event,
    Emitter<AppointmentStates> emit,
  ) {
    emit(
      state.copyWith(
        changeAppointmentIndex: event.index,
      ),
    );
  }

  FutureOr<void> _changeAppointmentCancelReason(
      ChangeAppointmentCancelReasonEvent event,
      Emitter<AppointmentStates> emit,
      ) {
    emit(
      state.copyWith(
        changeReason: event.reason,
      ),
    );
  }
}
