import 'package:dartz/dartz.dart';
import 'package:medical_health_clean_arch/core/error/failure.dart';

abstract class BaseUseCase<Type,Param>{
  Future<Either<Failure,Type>> execute(Param param);
}

abstract class BaseUseCase2<Type,Param,Param2>{
  Future<Either<Failure,Type>> execute(Param param,Param2 param2);
}
