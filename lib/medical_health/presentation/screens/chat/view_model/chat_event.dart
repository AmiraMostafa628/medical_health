abstract class ChatEvent {}

class ChatSendDataEvent extends ChatEvent {
  final String doctorId;
  final String dateTime;
  final String text;
  String? messageTime;

  ChatSendDataEvent({
    required this.doctorId,
    required this.dateTime,
    required this.text,
    this.messageTime,
  });
}

class ChatFetchDataEvent extends ChatEvent {
  final String doctorId;
  ChatFetchDataEvent({
    required this.doctorId,
  });
}

