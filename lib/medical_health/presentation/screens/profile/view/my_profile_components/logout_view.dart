import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';

void showLogOutBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: ColorManager.whiteColor,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Logout',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: ColorManager.primaryColor,
                fontSize: 20
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Are You Sure You Want To Log Out?',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: ColorManager.textBlackColor,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              spacing: 10.0,
              children: [
                Expanded(
                  child: CustomTextButton(
                    text: 'Cancel',
                    height: 50,
                    fontSize: 14,
                    upperCase: false,
                    borderRadius: BorderRadius.circular(20.0),
                    fontColor: ColorManager.primaryColor,
                    backGroundColor: ColorManager.lightPrimaryColor,
                  ),
                ),
                Expanded(
                  child: CustomTextButton(
                    text: 'Yes, Logout',
                    height: 50,
                    fontSize: 14,
                    upperCase: false,
                    borderRadius: BorderRadius.circular(20.0),
                    fontColor: ColorManager.whiteColor,
                    backGroundColor: ColorManager.primaryColor,
                  ),
                ),
              ],
            ),
        
          ],
        ),
      );
    },
  );
}


