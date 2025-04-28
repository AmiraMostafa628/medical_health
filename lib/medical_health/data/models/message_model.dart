import 'package:medical_health_clean_arch/medical_health/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {

  const MessageModel({
   required super.senderId,
   required super.receiverId,
   required super.dateTime,
   required super.messageTime,
   required super.text,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      dateTime: json['dateTime'],
      messageTime: json['messageTime'],
      text: json['text'],
    );
  }

  Map<String, dynamic>? toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'dateTime': dateTime,
      'messageTime': messageTime,
      'text': text,
    };
  }

}
