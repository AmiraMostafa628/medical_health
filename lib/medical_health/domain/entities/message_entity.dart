import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String senderId;
  final String receiverId;
  final String dateTime;
  final String messageTime;
  final String text;

  const MessageEntity({
   required this.senderId,
   required this.receiverId,
   required this.dateTime,
   required this.messageTime,
   required this.text,
  });

  @override
  List<Object?> get props => [
    senderId,
    receiverId,
    dateTime,
    messageTime,
    text,
  ];
}