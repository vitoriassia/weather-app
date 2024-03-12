import 'package:equatable/equatable.dart';
import 'package:pokedex_app/app/core/services/api/response/error_response.dart';

abstract class Failure {}

class ServerFailure extends Equatable implements Failure {
  final String? message;
  final ErrorResponse? errorResponse;
  const ServerFailure({
    this.message,
    this.errorResponse,
  });

  @override
  List<Object?> get props => [message, errorResponse];
}

class DataBaseFailure extends Equatable implements Failure {
  final String? message;
  const DataBaseFailure(this.message);

  @override
  List<Object?> get props => [message];
}
