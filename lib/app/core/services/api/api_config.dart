import 'package:dio/dio.dart';
import 'package:weather_app/app/core/config/build_config.dart';
import 'package:weather_app/app/core/services/api/api_config_base.dart';

class ApiConfig extends ApiConfigBase {
  @override
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: BuildConfig.instance.apiBaseUrl,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      );
  ApiConfig(super.dio, Interceptor super.interceptor);
}
