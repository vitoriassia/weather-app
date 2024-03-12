import 'package:equatable/equatable.dart';

class ErrorResponse extends Equatable {
  final int? code;
  final String? message;
  const ErrorResponse({
    this.code,
    this.message,
  });

  @override
  List<Object?> get props => [
        code,
        message,
      ];

  factory ErrorResponse.fromJson(dynamic json, int? code) {
    return ErrorResponse(
      code: code,
      message: _messageToJson(json),
    );
  }

  // Fazendo esse tratamento pela inconcistencia das repostas da API
  static String _messageToJson(dynamic json) {
    switch (json.runtimeType) {
      case String:
        return json;
      default:
        return json['error'];
    }
  }
}
