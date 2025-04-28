import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/notifications_view_components/notification_item.dart';

class TodayNotifications extends StatelessWidget {
  const TodayNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.lightPrimaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  'Today',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 20,
                        color: ColorManager.primaryColor,
                      ),
                ),
              ),
              Text(
                'Mark All',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
              )
            ],
          ),
        ),
        NotificationItem(
          title: 'Scheduled Appointment',
          subTitle:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          trailing: '2 M',
        ),
        NotificationItem(
          title: 'Scheduled Change',
          subTitle:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          trailing: '2 M',
        ),
        NotificationItem(
          title: 'Medical Notes',
          subTitle:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          trailing: '3 M',
        ),
      ],
    );
  }
}
