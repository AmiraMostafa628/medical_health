import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/setting_components/notification_setting_components/cashback.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/setting_components/notification_setting_components/general_notification.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/setting_components/notification_setting_components/payments_widget.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/setting_components/notification_setting_components/promo_and_discount_widget.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/setting_components/notification_setting_components/sound_call_widget.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/setting_components/notification_setting_components/sound_widget.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/setting_components/notification_setting_components/special_offers.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/setting_components/notification_setting_components/vibrate_widget.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/header.dart';

class NotificationSetting extends StatelessWidget {
 const NotificationSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30.0,
            children: [
              Header(title: 'Notification Setting'),
              GeneralNotificationWidget(),
              SoundWidget(),
              SoundCallWidget(),
              VibrateWidget(),
              SpecialOffersWidget(),
              PaymentsWidget(),
              PromoAndDiscountWidget(),
              CashbackWidget(),
          
            ],
          ),
        ),
      ),
    );
  }
}


