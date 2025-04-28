import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/action_decoration.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_states.dart';


class SortedDoctorList extends StatelessWidget {
   SortedDoctorList({
    super.key,
    required this.doctorsModel,
  });

  final List<DoctorEntity> doctorsModel;
  final List<String> title = [
    'rating',
    'Favorite',
    'Female',
    'Male',
    'Doctor Info',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeStates>(
      builder: (context,state) {
        return Column(
          children: doctorsModel.map((item) {
            bool condition = state.favoriteDoctors != null && state.favoriteDoctors!.contains(item);
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
                          Text(
                            item.docName,
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                                    fontWeight: FontWeight.w100, fontSize: 16),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            spacing: 3,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  HomeBloc.get(context).add(ChangeIconEvent(
                                      index: title.length - 1));
                                  HomeBloc.get(context).add(
                                      SelectedDoctorInfoEvent(doctorModel: item));
                                },
                                child: Container(
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
                              InkWell(
                                onTap: () async {
                                  if(state.favoriteDoctors != null){
                                    state.favoriteDoctors!.contains(item)?
                                    HomeBloc.get(context).add(DeleteFromFavoriteEvent(
                                        doctorModel: item)):
                                    HomeBloc.get(context).add(AddFavoriteEvent(
                                        doctorModel: item));
                                  }
                                },
                                child: ActionDecoration(
                                  icon: condition?
                                  Icons.favorite:
                                  Icons.favorite_border,),
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
      }
    );
  }
}
