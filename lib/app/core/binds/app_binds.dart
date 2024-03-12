import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:pokedex_app/app/core/binds/binds_helper.dart';
import 'package:pokedex_app/app/core/services/api/api_config.dart';
import 'package:pokedex_app/app/core/services/api/api_interceptor.dart';
import 'package:pokedex_app/app/core/services/api/api_service_impl.dart';

class AppBinds implements Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(Dio());
    Get.put<ApiInterceptor>(ApiInterceptor());
    Get.put<ApiConfig>(
      ApiConfig(
        BindsHelper.get<Dio>(),
        BindsHelper.get<ApiInterceptor>(),
      ),
    );
    Get.put<ApiServiceImpl>(
      ApiServiceImpl(
        apiConfig: BindsHelper.get<ApiConfig>(),
      ),
    );
  }
}
