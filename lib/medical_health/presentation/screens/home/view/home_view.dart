import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/assets_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/all_appointment/view/all_appointment_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/chat/view/chat_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/home_view_body.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_states.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_view.dart';



class HomeView extends StatelessWidget {
   HomeView({super.key});

  final List<Widget> screens = [
    HomeViewBody(),
    ChatView(),
    MyProfileView(),
    AllAppointmentView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeStates>(
          builder: (context, state) {
             return screens[state.selectedBottomNavbarIndex];
        }),
      ),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeStates>(
        builder: (context,state) {
          return DotCurvedBottomNav(
              selectedIndex: state.selectedBottomNavbarIndex,
              backgroundColor: ColorManager.primaryColor,
              height: 65,
              borderRadius: 30,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              onTap: (index) {
                HomeBloc.get(context).add(ChangeBottomNavEvent(index: index));
              },
              items: [
                SvgPicture.asset(
                  AssetsManager.home,
                  colorFilter: ColorFilter.mode(
                      state.selectedBottomNavbarIndex == 0
                          ? ColorManager.selectedColor
                          : ColorManager.whiteColor,
                      BlendMode.srcIn),
                ),
                SvgPicture.asset(
                  AssetsManager.chat,
                  colorFilter: ColorFilter.mode(
                      state.selectedBottomNavbarIndex == 1
                          ? ColorManager.selectedColor
                          : ColorManager.whiteColor,
                      BlendMode.srcIn),
                ),
                SvgPicture.asset(
                  AssetsManager.profileIcon,
                  colorFilter: ColorFilter.mode(
                      state.selectedBottomNavbarIndex == 2
                          ? ColorManager.selectedColor
                          : ColorManager.whiteColor,
                      BlendMode.srcIn),
                ),
                SvgPicture.asset(
                  AssetsManager.schedule,
                  colorFilter: ColorFilter.mode(
                      state.selectedBottomNavbarIndex == 3
                          ? ColorManager.selectedColor
                          : ColorManager.whiteColor,
                      BlendMode.srcIn),
                ),
              ]);
        }
      ),
    );
  }
}
