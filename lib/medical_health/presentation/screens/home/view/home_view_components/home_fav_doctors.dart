import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/fav_doctor_section.dart';

class HomeFavDoctors extends StatelessWidget {
  const HomeFavDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 30.0,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      GoRouter.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: ColorManager.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text('Favorite Doctors',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                ],
              ),
              FavDoctorSection(),
            ],
          ),
        ),
      ),
    );
  }
}
