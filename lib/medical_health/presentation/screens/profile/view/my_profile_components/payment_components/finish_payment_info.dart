import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/models/info_model.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/horizontal_divider.dart';

class FinishPaymentInfo extends StatelessWidget {
   FinishPaymentInfo({super.key});

  final List<InfoModel> section1 = [
    InfoModel(title: 'Date / Hour', titleInfo: 'Month 24, Year / 10:00 AM'),
    InfoModel(title: 'Duration', titleInfo: '30 Minutes'),
    InfoModel(title: 'Booking for', titleInfo: 'Another Person'),
  ];

   final List<InfoModel> section2 = [
     InfoModel(title: 'Amount', titleInfo: '\$100.00'),
     InfoModel(title: 'Duration', titleInfo: '30 Minutes'),
     InfoModel(title: 'Total', titleInfo: '\$100'),
   ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: section1.map((item) {
            return ListTile(
              title: Text(
                item.title,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: ColorManager.primaryColor
                ),
              ),
              trailing: Text(
                item.titleInfo,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 15,
                ),
              ),
            );
          }).toList(),
        ),
        HorizontalDivider(),
        Column(
          children: section2.map((item) {
            return ListTile(
              title: Text(
                item.title,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: ColorManager.primaryColor
                ),
              ),
              trailing: Text(
                item.titleInfo,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 15,
                ),
              ),
            );
          }).toList(),
        ),
        HorizontalDivider(),
        ListTile(
          title: Text(
            'Payment Method',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: ColorManager.lightPrimaryColor2Color
            ),
          ),
          trailing: SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Card',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Change',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: ColorManager.lightPrimaryColor2Color,
                    fontSize: 12,
                    decoration: TextDecoration.underline
                  ),
                ),
              ],
            ),
          ),
        )


      ],
    );
  }
}
