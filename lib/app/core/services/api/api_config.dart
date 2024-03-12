import 'package:dio/dio.dart';
import 'package:pokedex_app/app/core/config/build_config.dart';
import 'package:pokedex_app/app/core/services/api/api_config_base.dart';

class ApiConfig extends ApiConfigBase {
  @override
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: BuildConfig.instance.apiBaseUrl,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      );
  ApiConfig(Dio dio, Interceptor interceptor) : super(dio, interceptor);
}
