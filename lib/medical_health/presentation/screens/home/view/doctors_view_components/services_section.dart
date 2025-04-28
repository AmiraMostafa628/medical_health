import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_states.dart';

class ServicesSection extends StatelessWidget {
  ServicesSection({super.key});

  final List<String> medicalSpecialization = [
    'Dermato-Endocrinology',
    'Cosmetic Bioengineering',
    'Dermato-Genetics',
    'Solar Dermatology',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(builder: (context, state) {
      return Column(
        children: medicalSpecialization.asMap().entries.map((entry) {
          int index = entry.key;
          String item = entry.value;
          bool isExpand = index == state.selectMedicalSpecializationIndex;
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Column(
              spacing: 15.0,
              children: [
                GestureDetector(
                  onTap: () {
                    HomeBloc.get(context).add(ChangeMedicalSpecializationEvent(
                      index: isExpand ? -1 : index,
                    ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.favorite,
                        color: ColorManager.whiteColor,
                      ),
                      title: Text(
                        item,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: ColorManager.whiteColor,
                              fontSize: 16,
                            ),
                      ),
                      trailing: CircleAvatar(
                        radius: 16,
                        backgroundColor: ColorManager.whiteColor,
                        child: isExpand
                            ? Icon(
                                Icons.keyboard_arrow_up,
                                color: ColorManager.primaryColor,
                              )
                            : Icon(
                                Icons.keyboard_arrow_down,
                                color: ColorManager.primaryColor,
                              ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                    visible: isExpand,
                    child: Column(
                      spacing: 15.0,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                              color: ColorManager.lightPrimaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  fontWeight: FontWeight.w200,
                                  color: ColorManager.textBlackColor,
                                ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                              color: ColorManager.lightPrimaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'looking doctors',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: ColorManager.primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          );
        }).toList(),
      );
    });
  }
}
