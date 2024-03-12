import 'package:equatable/equatable.dart';
import 'package:pokedex_app/app/core/services/api/response/error_response.dart';

class ServerException extends Equatable implements Exception {
  final int? statusCode;
  final String? message;

  const ServerException({
    this.statusCode,
    required this.message,
  });

  @override
  List<Object?> get props => [statusCode, message];
}

class ClientException extends Equatable implements Exception {
  final int? statusCode;
  final ErrorResponse? errorResponse;

  const ClientException({
    this.statusCode,
    required this.errorResponse,
  });

  @override
  List<Object?> get props => [statusCode, errorResponse];
}

class HttpResponseException extends Equatable implements Exception {
  final int statusCode;
  final dynamic data;
  final dynamic error;
  const HttpResponseException({
    required this.statusCode,
    this.data,
    this.error,
  });

  @override
  List<Object?> get props => [statusCode, data, error];
}

class DataBaseException extends Equatable implements Exception {
  final String? message;

  const DataBaseException({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

class UnauthenticatedException implements Exception {}
