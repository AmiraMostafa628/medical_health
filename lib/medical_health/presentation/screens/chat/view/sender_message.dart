import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/message_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/assets_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';

class SenderMessage extends StatelessWidget {
  const SenderMessage({
    super.key,
    required this.messageContent,
  });

  final MessageEntity messageContent;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
          right: 10.0,
        ),
        child: IntrinsicWidth(
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2.0, left: 50.0),
                  child: Text(
                    messageContent.messageTime,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffABABAB),
                        ),
                  ),
                ),
              ),
              if (messageContent.text != '')
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                              color: ColorManager.lightPrimaryColor,
                              borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(20.0),
                                topEnd: Radius.circular(20.0),
                                bottomStart: Radius.circular(20.0),
                              )),
                          child: Text(
                            messageContent.text,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  color: ColorManager.textBlackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const CircleAvatar(
                        radius: 27,
                        backgroundImage: AssetImage(AssetsManager.profile),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
