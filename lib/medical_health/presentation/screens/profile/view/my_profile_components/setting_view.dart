import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/models/item_model.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';


class SettingView extends StatelessWidget {
  SettingView({super.key});

  final List<ItemModel> settingModel = [
    ItemModel(
      icon: FontAwesomeIcons.lightbulb,
      title: 'Notification Setting',
      navigateScreen: AppRouter.kNotificationSetting,
    ),
    ItemModel(
      icon: FontAwesomeIcons.key,
      title: 'Password Manager',
      navigateScreen: AppRouter.kPasswordManager,
    ),
    ItemModel(
      icon: Icons.person_2_outlined,
      title: 'Delete Account',
      navigateScreen: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 40,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Settings',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: settingModel.map((item) {
                return GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push(item.navigateScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ListTile(
                      leading: Transform(
                        transform: Matrix4.rotationY(3.141592653589793),
                        alignment: Alignment.center,
                        child: Icon(
                          item.icon,
                          size: 26,
                          color: ColorManager.primaryColor,
                        ),
                      ),
                      title: Text(
                        item.title,
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                              fontSize: 20,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      )),
    );
  }
}
