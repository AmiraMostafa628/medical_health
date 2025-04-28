import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:medical_health_clean_arch/core/shared_function/initial_orders.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/assets_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';

class CongratulationView extends StatelessWidget {
  const CongratulationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          spacing: 15.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: ColorManager.whiteColor, width: 10)),
              child: Icon(
                MdiIcons.check,
                color: ColorManager.whiteColor,
                size: 100,
              ),
            ),
            Text(
              'Congratulation',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: ColorManager.whiteColor, fontSize: 30),
            ),
            Text(
              'Payment is Successfully',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: ColorManager.whiteColor,
                    fontSize: 20,
                  ),
            ),
            SizedBox(
              height: 20.0,
            ),
            IntrinsicWidth(
              child: Container(
                padding: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorManager.whiteColor,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  spacing: 10.0,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'You have successfully booked an appointment with',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.w100,
                          color: ColorManager.whiteColor,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      doctorsModel[0].docName,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorManager.whiteColor,
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AssetsManager.schedule),
                            Text(
                              'Month 24, Year',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w100,
                                    color: ColorManager.whiteColor,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.alarm,
                              color: ColorManager.whiteColor,
                            ),
                            Text(
                              '10:00 AM',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w100,
                                    color: ColorManager.whiteColor,
                                  ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
