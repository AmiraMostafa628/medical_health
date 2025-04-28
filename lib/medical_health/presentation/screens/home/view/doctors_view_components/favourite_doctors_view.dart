import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/fav_doctor_section.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/services_section.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_states.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';

class FavouriteDoctorsView extends StatelessWidget {
   FavouriteDoctorsView({super.key});

  final List<Widget> favDoctorView = [
    FavDoctorSection(),
    ServicesSection(),

  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(
      builder: (context, state) {
      return Column(
        children: [
          Row(
            spacing: 15.0,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    HomeBloc.get(context)
                        .add(ChangeFavoriteButtonEvent(index: 0));
                  },
                  child: CustomTextButton(
                    text: 'Doctors',
                    height: 50,
                    upperCase: false,
                    fontColor: state.selectedFavoriteButtonIndex == 0
                        ? ColorManager.whiteColor
                        : ColorManager.primaryColor,
                    backGroundColor: state.selectedFavoriteButtonIndex == 0
                        ? ColorManager.primaryColor
                        : ColorManager.lightPrimaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    HomeBloc.get(context)
                        .add(ChangeFavoriteButtonEvent(index: 1));
                  },
                  child: CustomTextButton(
                    text: 'Services',
                    borderRadius: BorderRadius.circular(30),
                    height: 50,
                    upperCase: false,
                    fontColor: state.selectedFavoriteButtonIndex == 1
                        ? ColorManager.whiteColor
                        : ColorManager.primaryColor,
                    backGroundColor: state.selectedFavoriteButtonIndex == 1
                        ? ColorManager.primaryColor
                        : ColorManager.lightPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          favDoctorView[state.selectedFavoriteButtonIndex],
        ],
      );
    });
  }
}
