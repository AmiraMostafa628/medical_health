import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view_model/all_appointment_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view_model/all_appointment_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view_model/all_appointment_states.dart';

enum CancelAppointmentEnum {
  rescheduling('Rescheduling'),
  weatherConditions("Weather Conditions"),
  unexpectedWork("Unexpected Work"),
  others("others");

  final String reason;

  const CancelAppointmentEnum(this.reason);
}

class CancelAppointmentReason extends StatelessWidget {
  const CancelAppointmentReason({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentBloc, AppointmentStates>(
        builder: (context, state) {
      return Column(
        children: List.generate(CancelAppointmentEnum.values.length, (index) {
          final reason = CancelAppointmentEnum.values[index];

          return Container(
            decoration: BoxDecoration(
              color: state.changeReason.index == index
                  ? ColorManager.lightPrimaryColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: ListTile(
              title: Text(
                reason.reason,
              ),
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.w100, fontSize: 16),
              leading: Radio<CancelAppointmentEnum>(
                  value: reason,
                  groupValue: state.changeReason,
                  onChanged: (CancelAppointmentEnum? value) {
                    if (value!.reason.isNotEmpty) {
                      AppointmentBloc.get(context).add(
                        ChangeAppointmentCancelReasonEvent(reason: value),
                      );
                    }
                  }),
            ),
          );
        }),
      );
    });
  }
}
