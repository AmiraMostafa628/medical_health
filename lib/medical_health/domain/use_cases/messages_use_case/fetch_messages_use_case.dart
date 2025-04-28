import 'package:dartz/dartz.dart';
import 'package:medical_health_clean_arch/core/base_use_case/base_use_case.dart';
import 'package:medical_health_clean_arch/core/error/failure.dart';
import 'package:medical_health_clean_arch/medical_health/domain/base_repository/base_repository.dart';
import 'package:medical_health_clean_arch/medical_health/domain/entities/message_entity.dart';

class FetchMessagesUseCase extends BaseUseCase<List<MessageEntity>, String> {
  final BaseRepository baseRepository;

  FetchMessagesUseCase({
    required this.baseRepository,
  });

  @override
  Future<Either<Failure, List<MessageEntity>>> execute(String param) async {
    return await baseRepository.fetchMessage(param);
  }
}
