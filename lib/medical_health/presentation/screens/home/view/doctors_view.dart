import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:medical_health_clean_arch/core/shared_function/initial_orders.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/assets_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/doctors_info.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/favourite_doctors_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/gender_doctors_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/rating_doctors_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/sorted_doctor_list.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_states.dart';


class DoctorsView extends StatelessWidget {
  DoctorsView({super.key});

  final List<Widget> doctorViewDetails = [
    RatingDoctorsView(),
    FavouriteDoctorsView(),
    GenderDoctorsView(
      isMale: false,
    ),
    GenderDoctorsView(
      isMale: true,
    ),
    DoctorsInfo(),
  ];
  final List<String> titleList = [
    'rating',
    'Favorite',
    'Female',
    'Male',
    'Doctor Info',
  ];

  final List<IconData> icons = [
    Icons.star_border,
    Icons.favorite_border,
    Icons.female,
    Icons.male,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<HomeBloc, HomeStates>(
            builder: (context, state) {
              String title;
              if (state.selectedIconIndex == -1) {
                  title = 'Doctors';
              }
              else {
                  title = titleList[state.selectedIconIndex];
              }
          return SingleChildScrollView(
            child: Column(
              spacing: 20,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    Expanded(
                      child: Center(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: ColorManager.lightPrimaryColor,
                      child: Image.asset(
                        AssetsManager.search,
                        width: 15,
                        height: 15,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: ColorManager.lightPrimaryColor,
                      child: Icon(
                        MdiIcons.tuneVariant,
                        size: 15,
                        color: ColorManager.primaryColor,
                      ),
                    )
                  ],
                ),
                Row(
                  spacing: 10.0,
                  children: [
                    Text(
                      'Sort By',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: ColorManager.textBlack2Color,
                          ),
                    ),
                    GestureDetector(
                      onTap: () {
                        HomeBloc.get(context).add(ChangeIconEvent(index: -1));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: state.selectedIconIndex == -1 ||
                                  state.selectedIconIndex ==
                                      titleList.length - 1
                              ? ColorManager.primaryColor
                              : ColorManager.lightPrimaryColor,
                        ),
                        child: Text(
                          'A -> Z',
                          style: TextStyle(
                            color: state.selectedIconIndex == -1 ||
                                    state.selectedIconIndex ==
                                        titleList.length - 1
                                ? ColorManager.whiteColor
                                : ColorManager.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      spacing: 4.0,
                      children: icons.asMap().entries.map((entry) {
                        int index = entry.key;
                        var icon = entry.value;
                        return GestureDetector(
                          onTap: () {
                            HomeBloc.get(context)
                                .add(ChangeIconEvent(index: index));
                          },
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: state.selectedIconIndex == index
                                ? ColorManager.primaryColor
                                : ColorManager.lightPrimaryColor,
                            child: Icon(
                              icon,
                              size: 19,
                              color: state.selectedIconIndex == index
                                  ? ColorManager.whiteColor
                                  : ColorManager.primaryColor,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                state.selectedIconIndex == -1
                    ? SortedDoctorList(doctorsModel: sortedDoctorModel)
                    : doctorViewDetails[state.selectedIconIndex],
              ],
            ),
          );
        }),
      )),
    );
  }
}
