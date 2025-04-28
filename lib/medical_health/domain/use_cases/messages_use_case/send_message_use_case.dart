import 'package:dartz/dartz.dart';
import 'package:medical_health_clean_arch/core/base_use_case/base_use_case.dart';
import 'package:medical_health_clean_arch/core/error/failure.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/message_model.dart';
import 'package:medical_health_clean_arch/medical_health/domain/base_repository/base_repository.dart';

class SendMessageUseCase extends BaseUseCase<void,MessageModel> {
  final BaseRepository baseRepository;

  SendMessageUseCase({
    required this.baseRepository,
  });

  @override
  Future<Either<Failure, void>> execute(MessageModel param) async {
    return await baseRepository.sendMessage(param);
  }
}
