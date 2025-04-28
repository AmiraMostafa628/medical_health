import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_clean_arch/core/shared_function/initial_orders.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/message_model.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/messages_use_case/fetch_messages_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/messages_use_case/send_message_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/app_constance.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/chat/view_model/chat_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/chat/view_model/chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatStates> {
  static ChatBloc get(context) => BlocProvider.of(context);

  final SendMessageUseCase sendMessageUseCase;
  final FetchMessagesUseCase fetchMessagesUseCase;

  ChatBloc(
    this.sendMessageUseCase,
    this.fetchMessagesUseCase,
  ) : super(ChatStates()) {
    on<ChatSendDataEvent>(_sendMessage);
    on<ChatFetchDataEvent>(_getMessage);
  }

  FutureOr<void> _sendMessage(
    ChatSendDataEvent event,
    Emitter<ChatStates> emit,
  ) async {
    MessageModel model = MessageModel(
      senderId: uId,
      receiverId: event.doctorId,
      dateTime: event.dateTime,
      text: event.text,
      messageTime: event.messageTime!,
    );
    emit(
      state.copyWith(
        status: StatusType.loading,
      ),
    );
    final result = await sendMessageUseCase.execute(model);

    result.fold((failure) {
      emit(
        state.copyWith(
          status: StatusType.failure,
          errorMessage: failure.message,
        ),
      );
    }, (success) {
      emit(state.copyWith(
        messages: [...?state.messages,model],
        status: StatusType.success,
      ));
    });
  }

  Future<void> _getMessage(
    ChatFetchDataEvent event,
    Emitter<ChatStates> emit,
  ) async {

    final result = await fetchMessagesUseCase.execute(event.doctorId);

    result.fold((failure) {
      emit(
        state.copyWith(
          status: StatusType.failure,
          errorMessage: failure.message,
        ),
      );
    }, (messages) {
      emit(state.copyWith(
        messages: messages,
        status: StatusType.success,
      ));
    });




  }
}
