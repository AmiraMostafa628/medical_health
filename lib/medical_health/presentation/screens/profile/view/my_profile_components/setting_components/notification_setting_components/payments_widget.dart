import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_states.dart';

class PaymentsWidget extends StatelessWidget {
  const PaymentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileStates>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payments',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 20,
                ),
              ),
              FlutterSwitch(
                width: 50.0,
                height: 30.0,
                toggleSize: 20.0,
                value: state.paymentsSwitchVal,
                borderRadius: 30.0,
                padding: 4.0,
                activeColor: state.paymentsSwitchVal
                    ? ColorManager.primaryColor
                    : ColorManager.lightPrimaryColor,
                inactiveColor: state.paymentsSwitchVal
                    ? ColorManager.primaryColor
                    : ColorManager.lightPrimaryColor,
                toggleColor: Colors.white,
                onToggle: (val) {
                  ProfileBloc.get(context).add(
                    PaymentsEvent(
                      paymentsSwitchVal: val,
                    ),
                  );
                },
              ),
            ],
          );
        });
  }
}
