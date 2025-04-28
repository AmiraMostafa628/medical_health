import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/action_decoration.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/doctor_name_and_medical_specialization_section.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/rating_icon.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_states.dart';


class RatingDoctorsView extends StatelessWidget {
  const RatingDoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(builder: (context, state) {
      return Column(
        children: state.ratingDoctorsList!.map((item) {
          bool condition = state.favoriteDoctors !=null &&
              state.favoriteDoctors!.contains(item);
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorManager.lightPrimaryColor,
              ),
              child: Row(
                spacing: 12.0,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(item.docProfile),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 5.0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: ColorManager.primaryColor,
                              child: Icon(
                                FontAwesomeIcons.award,
                                size: 18,
                                color: ColorManager.whiteColor,
                              ),
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              'Professional Doctor',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            Spacer(),
                            RatingIcon(
                              docRating: item.docRate,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        DoctorNameAndMedicalSpecializationSection(
                          model: item,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          spacing: 3,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorManager.primaryColor,
                              ),
                              child: Text(
                                'Info',
                                style:
                                    TextStyle(color: ColorManager.whiteColor),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: (){
                                GoRouter.of(context)
                                    .push(AppRouter.kScheduleViewBody, extra: item);
                              },
                              child: ActionDecoration(
                                icon: Icons.calendar_month,
                              ),
                            ),
                            ActionDecoration(
                              icon: MdiIcons.informationVariant,
                            ),
                            ActionDecoration(
                              icon: Icons.question_mark,
                            ),
                            ActionDecoration(
                              icon: condition
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      );
    });
  }
}
