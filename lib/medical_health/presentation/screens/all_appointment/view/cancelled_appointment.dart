import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/core/shared_function/initial_orders.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';

class CancelledAppointment extends StatelessWidget {
  const CancelledAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorManager.lightPrimaryColor),
              child: Column(
                spacing: 15,
                children: [
                  Row(
                    spacing: 10.0,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          doctorsModel[index].docProfile,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          spacing: 2.0,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctorsModel[index].docName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: ColorManager.primaryColor,
                              ),
                            ),
                            Text(
                              doctorsModel[index].medicalSpecialization,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 14),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                  CustomTextButton(text: 'Add Review',
                    height: 45,
                    onPressed: (){
                    GoRouter.of(context).push(AppRouter.kAddCancelReview);
                    },
                    upperCase: false,
                    backGroundColor: ColorManager.primaryColor,
                    fontColor: ColorManager.whiteColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 10.0,
          ),
          itemCount: doctorsModel.length),
    );
  }
}
