import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/core/shared_function/initial_orders.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/assets_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
       backgroundImage: AssetImage(AssetsManager.profile),
      ),
      title: Text(
        'Hi, WelcomeBack',
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
            fontWeight: FontWeight.w100, color: ColorManager.primaryColor),
      ),
      subtitle: Text(model.name,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.w500,
              )),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          GestureDetector(
            onTap: (){
              GoRouter.of(context).push(AppRouter.kNotificationsView);
            },
            child: CircleAvatar(
              radius: 22,
              backgroundColor: ColorManager.lightPrimaryColor,
              child: Center(
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Icon(
                      FontAwesomeIcons.bell,
                      size: 24,
                      color: ColorManager.textBlack2Color,
                    ),
                    Positioned(
                      top: 2,
                      right: 2,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: ColorManager.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          CircleAvatar(
            radius: 22,
            backgroundColor: ColorManager.lightPrimaryColor,
            child: Center(
              child: Icon(
                MdiIcons.cogOutline,
                size: 24,
                color: ColorManager.textBlack2Color,
              ),
            ),
          )
        ],
      ),
    );
  }
}
