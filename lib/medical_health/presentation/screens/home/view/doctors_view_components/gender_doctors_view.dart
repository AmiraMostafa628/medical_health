import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/action_decoration.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_states.dart';

class GenderDoctorsView extends StatelessWidget {
  const GenderDoctorsView({super.key, required this.isMale});

  final bool isMale;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(builder: (context, state) {
      final List<DoctorEntity>? doctorList =
          isMale ? state.maleDoctorsList : state.femaleDoctorsList;
      return ConditionalBuilder(
          condition: doctorList != null,
          builder: (context) {
            return Column(
              children: doctorList!.map((item) {
                bool condition = state.favoriteDoctors != null &&
                    state.favoriteDoctors!.contains(item);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
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
                              Text(
                                item.docName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: ColorManager.primaryColor,
                                    ),
                              ),
                              Text(
                                item.medicalSpecialization,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 16),
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
                                      style: TextStyle(
                                          color: ColorManager.whiteColor),
                                    ),
                                  ),
                                  Spacer(),
                                  ActionDecoration(
                                    icon: Icons.calendar_month,
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
          },
          fallback: (context)=>Container());
    });
  }
}
