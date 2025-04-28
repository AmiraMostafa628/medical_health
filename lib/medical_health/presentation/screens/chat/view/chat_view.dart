import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/core/shared_function/initial_orders.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/header.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        spacing: 30,
        children: [
          Header(
            title: 'Chat',
          ),
          Column(
            spacing: 10,
            children: doctorsModel.map((item) {
              return Column(
                children: [
                  GestureDetector(
                    onTap:(){
                      GoRouter.of(context).push(AppRouter.kChatViewBody,extra: item);
                    },
                    child: Row(
                      spacing: 20.0,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            item.docProfile,
                          ),
                        ),
                        Column(
                          spacing: 2.0,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.docName,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                  fontSize: 20,
                                  color: ColorManager.primaryColor),
                            ),
                            Text(
                              item.medicalSpecialization,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade200,
                    height: 40,
                  )
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
