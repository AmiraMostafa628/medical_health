import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/assets_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';


class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.trailing,
    this.icon,
  });

  final String title;
  final String subTitle;
  final String trailing;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        child: SvgPicture.asset(
          icon ?? AssetsManager.schedule,
          colorFilter: ColorFilter.mode(
            ColorManager.whiteColor,
            BlendMode.srcIn,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            trailing,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: ColorManager.textBlackColor,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: ColorManager.textBlackColor,
          fontWeight: FontWeight.w100,
          height: 0.9,
        ),
      ),
    );
  }
}