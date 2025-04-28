import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view_model/schedule_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/schedule/view_model/schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleStates> {
  static ScheduleBloc get(context) => BlocProvider.of(context);

  ScheduleBloc()
      : super(ScheduleStates(
          selectedScheduleDay: DateTime.now().day - 1,
        )) {
    on<ScheduleSelectDateIndexEvent>(_selectedScheduleDay);
    on<SelectDateValueEvent>(_selectedDate);
  }

  FutureOr<void> _selectedScheduleDay(
    ScheduleSelectDateIndexEvent event,
    Emitter<ScheduleStates> emit,
  ) {
    emit(
      state.copyWith(
        selectedScheduleDay: event.index,
      ),
    );
  }

  FutureOr<void> _selectedDate(
      SelectDateValueEvent event,
      Emitter<ScheduleStates> emit,
      ) {
    emit(
      state.copyWith(
        currentDate: event.currentDate,
      ),
    );
  }
}
