import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String statusMessage;

  const ErrorMessageModel({
    required this.statusMessage,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
        statusMessage: json['status_message'],
    );
  }

  @override
  List<Object?> get props => [
        statusMessage,
      ];
}
