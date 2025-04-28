import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/models/item_model.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/assets_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/logout_view.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/header.dart';


class MyProfileView extends StatelessWidget {
  MyProfileView({super.key});

  final List<ItemModel> profileModel = [
    ItemModel(
        icon: Icons.person_2_outlined,
        title: 'Profile',
        navigateScreen: AppRouter.kEditProfileView),
    ItemModel(
        icon: Icons.favorite_border, title: 'Favorite', navigateScreen: ''),
    ItemModel(
        icon: Icons.payment_outlined,
        title: 'Payment Method',
        navigateScreen: AppRouter.kPaymentMethodView),
    ItemModel(
        icon: Icons.lock,
        title: 'Privacy Policy',
        navigateScreen: AppRouter.kPrivacyPolicyView),
    ItemModel(
        icon: Icons.settings,
        title: 'Setting',
        navigateScreen: AppRouter.kSettingView),
    ItemModel(
        icon: Icons.question_mark,
        title: 'Help',
        navigateScreen: AppRouter.kHelpView),
    ItemModel(icon: Icons.logout, title: 'Logout', navigateScreen: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 15.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  title: 'My Profile'),
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(AssetsManager.profile),
                    ),
                    Positioned(
                      bottom: 10,
                      child: CircleAvatar(
                        radius: 12,
                        child: Icon(
                          Icons.edit,
                          size: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Text(
                  'Amira Mostafa',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: ColorManager.textBlackColor,
                      ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Column(
                children: profileModel.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        if (item.title == 'Logout') {
                          showLogOutBottomSheet(context);
                        } else if (item.navigateScreen.isNotEmpty) {
                          GoRouter.of(context).push(item.navigateScreen);
                        }
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: ColorManager.lightPrimaryColor,
                          child: Icon(
                            item.icon,
                            size: 20,
                            color: ColorManager.primaryColor,
                          ),
                        ),
                        title: Text(
                          item.title,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                fontSize: 20,
                              ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorManager.lightPrimaryColor,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
