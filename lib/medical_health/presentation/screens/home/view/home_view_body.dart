import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/app_constance.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/assets_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/home_view_components/date_section.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/home_view_components/home_doctor_list_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/home_view_components/home_header.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_states.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_form_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(builder: (context, state) {
      if (state.status == StatusType.success) {
        HomeBloc.get(context).add(GetFavoriteEvent());
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HomeHeader(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20.0, bottom: 20.0, right: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 14.0,
                  children: [
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kDoctorsView);
                      },
                      child: Column(
                        children: [
                          Icon(
                            MdiIcons.stethoscope,
                            color: ColorManager.primaryColor,
                          ),
                          Text(
                            'Doctors',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w200,
                                    color: ColorManager.primaryColor),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kFavView);
                      },
                      child: Column(
                        children: [
                          Icon(
                            MdiIcons.heartOutline,
                            color: ColorManager.primaryColor,
                          ),
                          Text(
                            'Favorite',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w200,
                                    color: ColorManager.primaryColor),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormField(
                          text: '',
                          height: 50,
                          borderRadius: 20,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              backgroundColor: ColorManager.whiteColor,
                              child: Icon(
                                MdiIcons.tuneVariant,
                                size: 20,
                                color: ColorManager.textBlack2Color,
                              ),
                            ),
                          ),
                          suffixIcon: ImageIcon(
                            AssetImage(AssetsManager.search),
                            color: ColorManager.primaryColor,
                          ),
                          textEditingController: TextEditingController()),
                    )
                  ],
                ),
              ),
              DateSection(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: HomeDoctorListView(),
              ),
            ],
          ),
        );
      } else if (state.status == StatusType.loadingHome) {
        return Center(child: CircularProgressIndicator());
      }
      return Container();
    });
  }
}
