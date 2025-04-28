import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/action_decoration.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_states.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';


class FavDoctorSection extends StatelessWidget {
  const FavDoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeStates>(
      builder: (context,state) {
        return ConditionalBuilder(
            condition: state.favoriteDoctors != null,
            builder: (context){
              return Column(
                children: state.favoriteDoctors!.map((item){
                  bool condition = state.favoriteDoctors != null && state.favoriteDoctors!.contains(item);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorManager.lightPrimaryColor,
                      ),
                      child: Row(
                        spacing: 12.0,
                        children: [
                          CircleAvatar(
                            radius: 40,
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
                                      child: Icon(FontAwesomeIcons.award,size: 18,
                                        color: ColorManager.whiteColor,),
                                    ),
                                    SizedBox(width: 4.0,),
                                    Text('Professional Doctor',
                                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                        fontWeight: FontWeight.w400,


                                      ),
                                    ),
                                  ],),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: ColorManager.whiteColor,
                                  ),
                                  child: Row(
                                    spacing: 5.0,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        spacing: 5.0,
                                        children: [
                                          Text(item.docName,
                                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: ColorManager.primaryColor,

                                            ),
                                          ),
                                          Text(item.medicalSpecialization,
                                            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                                fontWeight: FontWeight.w100,
                                                fontSize: 12

                                            ),
                                          ),

                                        ],
                                      ),
                                      ActionDecoration(icon: condition?Icons.favorite:Icons.favorite_border,)
                                    ],
                                  ),
                                ),

                                CustomTextButton(text: 'Make Appointment',
                                  fontSize: 12,
                                  fontWeight:FontWeight.w100,
                                  height: 40,
                                  borderRadius: BorderRadius.circular(30),
                                  upperCase: false,
                                ),
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
            fallback: (context)=> Center(
              child: Text('No Favourite Doctors yet',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorManager.primaryColor,
                  fontWeight: FontWeight.w200
                ),
              ),
            ));
      }
    );
  }
}
