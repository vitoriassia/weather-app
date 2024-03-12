import 'package:equatable/equatable.dart';

class DataWrapperResponse<T> extends Equatable {
  final bool? success;
  final T? result;
  const DataWrapperResponse({this.success, this.result});

  @override
  List<Object?> get props => [
        success,
        result,
      ];

  factory DataWrapperResponse.fromJson(dynamic json, int? statusCode) {
    return DataWrapperResponse<T>(
      success: statusCode == 200 || statusCode == 201,
      result: json,
    );
  }
}
