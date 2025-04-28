import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_states.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';

class FaqSection extends StatelessWidget {
  FaqSection({super.key});

  final List<String> popularTopic = [
    'Lorem ipsum dolor sit amet?',
    'Lorem ipsum dolor sit amet?',
    'Lorem ipsum dolor sit amet?',
    'Lorem ipsum dolor sit amet?',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Row(
          spacing: 10.0,
          children: [
            Expanded(
              child: CustomTextButton(
                text: 'Popular Topic',
                fontSize: 12,
                borderRadius: BorderRadius.circular(30),
                height: 42,
                upperCase: false,
                fontColor: ColorManager.whiteColor,
                backGroundColor: ColorManager.primaryColor,
              ),
            ),
            Expanded(
              child: CustomTextButton(
                text: 'General',
                fontSize: 12,
                borderRadius: BorderRadius.circular(30),
                height: 42,
                upperCase: false,
                fontColor: ColorManager.primaryColor,
                backGroundColor: ColorManager.lightPrimaryColor,
              ),
            ),
            Expanded(
              child: CustomTextButton(
                text: 'Services',
                fontSize: 12,
                borderRadius: BorderRadius.circular(30),
                height: 42,
                upperCase: false,
                fontColor: ColorManager.primaryColor,
                backGroundColor: ColorManager.lightPrimaryColor,
              ),
            ),
          ],
        ),
        BlocBuilder<ProfileBloc, ProfileStates>(builder: (context, state) {
          return Column(
            children: popularTopic.asMap().entries.map((entry) {
              int index = entry.key;
              String item = entry.value;
              bool isExpand = index == state.selectedPopularTopicIndexIndex;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: Column(
                  spacing: 15.0,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ProfileBloc.get(context)
                            .add(ChangePopularTopicIndexEvent(
                          index: isExpand ? -1 : index,
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.textFromFieldColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          title: Text(
                            item,
                            style:
                                Theme.of(context).textTheme.displaySmall,
                          ),
                          trailing: CircleAvatar(
                            radius: 16,
                            backgroundColor: ColorManager.whiteColor,
                            child: isExpand
                                ? Icon(
                                    Icons.keyboard_arrow_up,
                                    color: ColorManager.primaryColor,
                                  )
                                : Icon(
                                    Icons.keyboard_arrow_down,
                                    color: ColorManager.primaryColor,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: isExpand,
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                              color: ColorManager.whiteColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  fontWeight: FontWeight.w200,
                                  color: ColorManager.textBlackColor,
                                ),
                          ),
                        ))
                  ],
                ),
              );
            }).toList(),
          );
        })
      ],
    );
  }
}
