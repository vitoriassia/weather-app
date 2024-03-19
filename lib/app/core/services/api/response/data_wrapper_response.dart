import 'package:equatable/equatable.dart';
import 'package:weather_app/app/core/services/api/response/http_response.dart';

class DataWrapperResponse<T> extends Equatable {
  final bool? success;
  final T? result;
  const DataWrapperResponse({this.success, this.result});

  @override
  List<Object?> get props => [
        success,
        result,
      ];

  factory DataWrapperResponse.fromJson(HttpResponse response) {
    return DataWrapperResponse<T>(
      success: response.statusCode == 200 || response.statusCode == 201,
      result: response.data,
    );
  }
}
