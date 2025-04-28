import 'package:medical_health_clean_arch/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({
    required this.errorMessageModel,
  });
}

class VerificationException implements Exception {
  final String message;

  VerificationException({
    required this.message,
  });
}
