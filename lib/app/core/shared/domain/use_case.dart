import 'package:dartz/dartz.dart';
import 'package:weather_app/app/core/services/api/errors/failures.dart';

abstract class UseCase<Params, OutPut> {
  Future<Either<Failure, OutPut>> call(Params params);
}

class NoParams {}
