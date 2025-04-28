import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/assets_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/notifications_view_components/notification_item.dart';

class AprilNotifications extends StatelessWidget {
  const AprilNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            bottom: 10.0,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 8.0,
            ),
            decoration: BoxDecoration(
              color: ColorManager.lightPrimaryColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              '15 April',
              style:
              Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: 20,
                color: ColorManager.primaryColor,
              ),
            ),
          ),
        ),
        NotificationItem(
          icon: AssetsManager.notificationChat,
          title: 'Medical History Update',
          subTitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          trailing: '5 D',
        ),
        NotificationItem(
          icon: AssetsManager.notificationChat,
          title: 'Medical History Update',
          subTitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          trailing: '5 D',
        ),
        NotificationItem(
          icon: AssetsManager.notificationChat,
          title: 'Medical History Update',
          subTitle:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          trailing: '5 D',
        ),

      ],
    );
  }
}
