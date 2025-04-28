import 'package:equatable/equatable.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/message_entity.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/app_constance.dart';

class ChatStates extends Equatable {
  final List<MessageEntity>? messages;
  final StatusType? status;
  final String? errorMessage;

  const ChatStates({
    this.messages,
    this.status,
    this.errorMessage,
  });

  ChatStates copyWith({
    List<MessageEntity>? messages,
    StatusType? status,
    String? errorMessage,
  }) {
    return ChatStates(
      messages: messages ?? this.messages,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        messages,
        status,
        errorMessage,
      ];
}
