import 'package:dio/dio.dart';

abstract class ApiConfigBase {
  final Dio dio;
  final Interceptor? interceptor;
  BaseOptions get baseOptions;

  ApiConfigBase(this.dio, this.interceptor) {
    dio.options = baseOptions;
    if (interceptor != null) {
      dio.interceptors.add(interceptor!);
    }
  }
}
