import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/assets_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/action_decoration.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_states.dart';


class ScheduleHeader extends StatelessWidget {
  const ScheduleHeader({
    super.key,
    required this.doctorModel,
  });

  final DoctorEntity doctorModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.0,
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
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.kScheduleDoctor,
              extra: doctorModel,
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: ColorManager.primaryColor,
            ),
            child: Row(
              spacing: 10.0,
              children: [
                SvgPicture.asset(
                  AssetsManager.schedule,
                  colorFilter: ColorFilter.mode(
                    ColorManager.whiteColor,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  'Schedule',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: ColorManager.whiteColor,
                        fontWeight: FontWeight.w100,
                      ),
                ),
              ],
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
        Spacer(),
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
