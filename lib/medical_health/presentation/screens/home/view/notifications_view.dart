import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/notifications_view_components/april_notifications.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/notifications_view_components/today_notifications.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/notifications_view_components/yesterday_notifications.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: ColorManager.primaryColor,
                        ),
                      ),
                      Center(
                        child: Text(
                          'Notification',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.lightPrimaryColor,
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                        ),
                        child: Row(
                          spacing: 4.0,
                          children: [
                            Text(
                              'News',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: ColorManager.primaryColor,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                TodayNotifications(),
                YesterdayNotifications(),
                AprilNotifications(),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
