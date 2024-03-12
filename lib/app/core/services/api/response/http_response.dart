// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class HttpResponse extends Equatable {
  final int? statusCode;
  final dynamic data;
  final dynamic error;
  const HttpResponse({
    required this.statusCode,
    this.data,
    this.error,
  });

  @override
  List<Object?> get props => [statusCode, data, error];
}
