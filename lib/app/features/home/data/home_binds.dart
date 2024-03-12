import 'package:get/instance_manager.dart';
import 'package:weather_app/app/core/binds/binds_helper.dart';
import 'package:weather_app/app/core/services/api/api_service_impl.dart';
import 'package:weather_app/app/features/home/data/home_remote_data_source_impl.dart';
import 'package:weather_app/app/features/home/data/home_repository_impl.dart';

class HomeBinds implements Bindings {
  @override
  void dependencies() {
    // ================== DOMAIN =================== //
    Get.put<HomeRemoteDataSourceImpl>(
      HomeRemoteDataSourceImpl(
        BindsHelper.get<ApiServiceImpl>(),
      ),
    );
    Get.put<HomeRepositoryImpl>(
      HomeRepositoryImpl(
        BindsHelper.get<HomeRemoteDataSourceImpl>(),
      ),
    );
    // ================== USE CASES ============== //

    // ================ CONTROLLER =============== //
  }
}
