import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view/cancel_appointment_reason.dart';

abstract class AppointmentEvent {}

class ChangeAppointmentTypeEvent extends AppointmentEvent {
  final int index;

  ChangeAppointmentTypeEvent({
    required this.index,
  });
}

class ChangeAppointmentCancelReasonEvent extends AppointmentEvent {
  final CancelAppointmentEnum reason;

  ChangeAppointmentCancelReasonEvent({
    required this.reason,
  });
}
