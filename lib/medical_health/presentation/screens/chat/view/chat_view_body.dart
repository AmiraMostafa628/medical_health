import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medical_health_clean_arch/core/shared_function/initial_orders.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/doctor_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/chat/view/receiver_message.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/chat/view/sender_message.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/chat/view_model/chat_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/chat/view_model/chat_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/chat/view_model/chat_state.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_form_field.dart';


class ChatViewBody extends StatelessWidget {
  ChatViewBody({super.key, required this.doctorModel});

  final DoctorEntity doctorModel;
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ChatBloc, ChatStates>(builder: (context, state) {
          ChatBloc.get(context)
              .add(ChatFetchDataEvent(doctorId: doctorModel.docId));
          DateTime now = DateTime.now();
          String formattedTime = DateFormat.jm().format(now);
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                color: ColorManager.primaryColor,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 30.0,
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    GestureDetector(
                     onTap:(){
                       GoRouter.of(context).pop();
                     },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: ColorManager.whiteColor,
                      ),
                    ),
                    Text(
                      doctorModel.docName,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: ColorManager.whiteColor,
                            fontSize: 19,
                          ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 15.0,
                      backgroundColor: ColorManager.whiteColor,
                      child: Icon(
                        Icons.add_ic_call_outlined,
                        size: 17,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    CircleAvatar(
                      radius: 15.0,
                      backgroundColor: ColorManager.whiteColor,
                      child: Icon(
                        Icons.video_camera_back_outlined,
                        size: 17,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ConditionalBuilder(
                condition: state.messages != null,
                builder: (context) => Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        final message = state.messages![index];
                        if (uId == message.senderId) {
                          return SenderMessage(
                            messageContent: message,
                          );
                        }
                        return ReceiverMessage(
                          messageContent: message,
                          doctor: doctorModel,
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 20.0,
                          ),
                      itemCount: state.messages!.length),
                ),
                fallback: (context) => Spacer(),
              ),
              Container(
                color: ColorManager.lightBlueColor,
                height: 100,
                width: double.infinity,
                padding: EdgeInsets.all(
                  20.0,
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    FloatingActionButton(
                      heroTag: 'attach',
                      onPressed: () {},
                      mini: true,
                      shape: CircleBorder(),
                      backgroundColor: ColorManager.whiteColor,
                      child: Icon(
                        FontAwesomeIcons.paperclip,
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        text: 'Write Here',
                        filledColor: ColorManager.whiteColor,
                        borderRadius: 30.0,
                        type: TextInputType.text,
                        textEditingController: messageController,
                        suffixIcon: Icon(
                          Icons.mic,
                          size: 26,
                          color: ColorManager.primaryColor,
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: 'send',
                      onPressed: () {
                        if (messageController.text.isNotEmpty) {
                          ChatBloc.get(context).add(
                            ChatSendDataEvent(
                              doctorId: doctorModel.docId,
                              dateTime: DateTime.now().toString(),
                              text: messageController.text,
                              messageTime: formattedTime,
                            ),
                          );
                          messageController.clear();
                        }
                      },
                      mini: true,
                      shape: CircleBorder(),
                      backgroundColor: ColorManager.primaryColor,
                      child: Icon(
                        Icons.send,
                        size: 20,
                        color: ColorManager.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}




