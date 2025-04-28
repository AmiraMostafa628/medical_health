import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/action_decoration.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_states.dart';

class ScheduleDoctorHeader extends StatelessWidget {
  const ScheduleDoctorHeader({
    super.key,
    required this.doctorModel,
  });

  final DoctorEntity doctorModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2.0,
      children: [
        InkWell(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.primaryColor,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 8.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: ColorManager.primaryColor,
          ),
          child: Text(
            doctorModel.docName,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: ColorManager.whiteColor,
                  fontSize: 12.0,
                ),
          ),
        ),
        ActionDecoration(
          icon: Icons.phone_in_talk,
          iconSize: 16,
          backgroundColor: ColorManager.primaryColor,
          iconColor: ColorManager.whiteColor,
        ),
        ActionDecoration(
          icon: FontAwesomeIcons.video,
          iconSize: 16,
          backgroundColor: ColorManager.primaryColor,
          iconColor: ColorManager.whiteColor,
        ),
        ActionDecoration(
          icon: FontAwesomeIcons.comments,
          iconSize: 16,
          backgroundColor: ColorManager.primaryColor,
          iconColor: ColorManager.whiteColor,
        ),
        ActionDecoration(
          icon: Icons.question_mark,
          backgroundColor: ColorManager.lightPrimaryColor,
          iconColor: ColorManager.primaryColor,
        ),
        BlocBuilder<HomeBloc,HomeStates>(
            builder: (context,state) {
              bool condition = state.favoriteDoctors != null && state.favoriteDoctors!.contains(doctorModel);
              return ActionDecoration(
                icon: condition?Icons.favorite:Icons.favorite_border,
                backgroundColor: ColorManager.lightPrimaryColor,
                iconColor: ColorManager.primaryColor,
              );
            }
        ),
      ],
    );
  }
}
