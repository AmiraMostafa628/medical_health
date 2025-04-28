import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:medical_health_clean_arch/core/shared_function/initial_orders.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view/doctors_view_components/action_decoration.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';

class UpcomingAppointment extends StatelessWidget {
  const UpcomingAppointment({super.key});

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: ColorManager.whiteColor,
                        ),
                        child: Row(
                          spacing: 2.0,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: ColorManager.primaryColor,
                            ),
                            Text(
                              'Sunday, 12 June',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 12,
                                    color: ColorManager.primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: ColorManager.whiteColor,
                        ),
                        child: Row(
                          spacing: 2.0,
                          children: [
                            Icon(
                              MdiIcons.alarm,
                              color: ColorManager.primaryColor,
                            ),
                            Text(
                              '9:30 AM - 10:00 AM',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 12,
                                    color: ColorManager.primaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 10.0,
                    children: [
                      Expanded(
                        child: CustomTextButton(
                          text: 'Details',
                          upperCase: false,
                          height: 45,
                          backGroundColor: ColorManager.primaryColor,
                          fontColor: ColorManager.whiteColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      ActionDecoration(
                        icon: FontAwesomeIcons.check,
                        iconSize: 15,
                      ),
                      ActionDecoration(
                        icon: MdiIcons.closeThick,
                        iconSize: 15,

                      ),
                    ],
                  )
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
