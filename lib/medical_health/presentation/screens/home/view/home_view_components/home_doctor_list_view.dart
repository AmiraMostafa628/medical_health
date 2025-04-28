import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_clean_arch/core/shared_function/initial_orders.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/doctor_name_and_medical_specialization_section.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/home_view_components/chat_num_icon.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_states.dart';

class HomeDoctorListView extends StatelessWidget {
  const HomeDoctorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeStates>(
        builder: (context,state){
          return Column(
            children: doctorsModel.map((item){
              bool condition = state.favoriteDoctors != null && state.favoriteDoctors!.contains(item);
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorManager.lightPrimaryColor,
                  ),
                  child: Row(
                    spacing: 12.0,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(item.docProfile),
                      ),
                      Expanded(
                        child: Column(
                          spacing: 5.0,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DoctorNameAndMedicalSpecializationSection(
                              model: item,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: ColorManager.whiteColor,
                                  ),
                                  child: Row(
                                    spacing: 5,
                                    children: [
                                      Icon(Icons.star,color: ColorManager.primaryColor,size: 16,),
                                      Text(item.docRate.toString(),
                                        style: TextStyle(
                                          color: ColorManager.primaryColor
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.0,),
                                ChatNumIcon(chatNum: item.chatNum,),
                                Spacer(),
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: ColorManager.whiteColor,
                                  child: Icon(Icons.question_mark,size: 22,
                                    color: ColorManager.primaryColor,),
                                ),
                                SizedBox(width: 5.0,),
                                GestureDetector(
                                  onTap: () async {
                                    if(state.favoriteDoctors != null) {
                                      state.favoriteDoctors!.contains(item) ?
                                      HomeBloc.get(context).add(
                                          DeleteFromFavoriteEvent(
                                              doctorModel: item)) :
                                      HomeBloc.get(context).add(
                                          AddFavoriteEvent(doctorModel: item));
                                    }
                                    },
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: ColorManager.whiteColor,
                                    child: Icon(condition?Icons.favorite:Icons.favorite_border,size: 22,
                                      color: ColorManager.primaryColor,),
                                  ),
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
