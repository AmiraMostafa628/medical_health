import 'package:equatable/equatable.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view/cancel_appointment_reason.dart';

class AppointmentStates extends Equatable {
  final int changeAppointmentIndex;
  final CancelAppointmentEnum changeReason;

  const AppointmentStates({
    this.changeAppointmentIndex = 0,
    this.changeReason = CancelAppointmentEnum.weatherConditions,
  });

  AppointmentStates copyWith({
    int? changeAppointmentIndex,
    CancelAppointmentEnum? changeReason,
  }) {
    return AppointmentStates(
      changeAppointmentIndex: changeAppointmentIndex ?? this.changeAppointmentIndex,
      changeReason: changeReason ?? this.changeReason,
    );
  }

  @override
  List<Object?> get props => [
        changeAppointmentIndex,
        changeReason,
      ];
}
