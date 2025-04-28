import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/action_decoration.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/doctor_name_and_medical_specialization_section.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/rating_icon.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/home_view_components/chat_num_icon.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_states.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/information_widget.dart';


class DoctorsInfo extends StatelessWidget {
  const DoctorsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(
        builder: (context, state) {
      final DoctorEntity doctorModel = state.doctorInfo!;
      bool condition = state.favoriteDoctors != null && state.favoriteDoctors!.contains(doctorModel);
      return Column(
        spacing: 20,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10.0),
            decoration: BoxDecoration(
                color: ColorManager.lightPrimaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              spacing: 15.0,
              children: [
                Row(
                  spacing: 10.0,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(doctorModel.docProfile),
                    ),
                    Column(
                      spacing: 8.0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            color: ColorManager.primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            spacing: 5.0,
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: ColorManager.lightPrimaryColor,
                                child: Icon(
                                  FontAwesomeIcons.award,
                                  size: 18,
                                  color: ColorManager.primaryColor,
                                ),
                              ),
                              Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '15 years',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: ColorManager.whiteColor,
                                        ),
                                  ),
                                  Text(
                                    'experience',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w100,
                                          color: ColorManager.whiteColor,
                                        ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.3,
                          ),
                          decoration: BoxDecoration(
                            color: ColorManager.primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: RichText(
                              overflow: TextOverflow.visible,
                              text: TextSpan(
                                text: 'Focus: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: ColorManager.whiteColor,
                                    ),
                                children: [
                                  TextSpan(
                                    text:
                                        'The impact of hormonal imbalances on skin conditions, specializing in acne, hirsutism, and other skin disorders.',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 12,
                                          color: ColorManager.whiteColor,
                                        ),
                                  )
                                ],
                              )),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: DoctorNameAndMedicalSpecializationSection(
                    model: doctorModel,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingIcon(
                      docRating: doctorModel.docRate,
                    ),
                    ChatNumIcon(chatNum: doctorModel.chatNum),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ColorManager.whiteColor,
                      ),
                      child: Row(
                        spacing: 2.0,
                        children: [
                          Icon(
                            MdiIcons.alarm,
                            color: ColorManager.primaryColor,
                          ),
                          Text(
                            'Mon-Sat / 9:00AM - 5:00PM',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 11,
                                  color: ColorManager.primaryColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 3,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ColorManager.primaryColor,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: ColorManager.whiteColor,
                          ),
                          Text(
                            'Schedule',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w100,
                                  color: ColorManager.whiteColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    ActionDecoration(
                      icon: MdiIcons.informationVariant,
                    ),
                    ActionDecoration(
                      icon: Icons.question_mark,
                    ),
                    ActionDecoration(
                      icon: Icons.star_border,
                    ),
                    ActionDecoration(
                      icon: condition?
                      Icons.favorite:
                      Icons.favorite_border,),
                  ],
                ),
              ],
            ),
          ),
          InformationWidget(
            title: 'Profile',
          ),
          InformationWidget(
            title: 'career path',
          ),
          InformationWidget(
            title: 'highlights',
          )
        ],
      );
    });
  }
}
