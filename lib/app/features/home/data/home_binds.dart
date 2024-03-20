import 'package:get/instance_manager.dart';
import 'package:weather_app/app/core/binds/binds_helper.dart';
import 'package:weather_app/app/core/services/api/api_service_impl.dart';
import 'package:weather_app/app/core/storage/main_cities/main_cities_reader.dart';
import 'package:weather_app/app/core/storage/main_cities/main_cities_writer.dart';
import 'package:weather_app/app/features/home/data/home_local_data_source_impl.dart';

import 'package:weather_app/app/features/home/data/home_remote_data_source_impl.dart';
import 'package:weather_app/app/features/home/data/home_repository_impl.dart';
import 'package:weather_app/app/features/home/domain/useCases/get_list_main_events_use_case.dart';
import 'package:weather_app/app/features/home/domain/useCases/get_weather_forecast_main_cities_use_case.dart';
import 'package:weather_app/app/features/home/presentation/controllers/home_controller.dart';

class HomeBinds implements Bindings {
  @override
  void dependencies() {
    // STORAGE
    Get.put<MainCitiesReader>(
      MainCitiesReader.getInstance(),
    );
    Get.put<MainCitiesWriter>(
      MainCitiesWriter.getInstance(),
    );
    // ================== DOMAIN =================== //
    Get.put<HomeRemoteDataSourceImpl>(
      HomeRemoteDataSourceImpl(
        BindsHelper.get<ApiServiceImpl>(),
      ),
    );

    Get.put<HomeLocalDataSourceImpl>(
      HomeLocalDataSourceImpl(
        BindsHelper.get<MainCitiesWriter>(),
        BindsHelper.get<MainCitiesReader>(),
      ),
    );
    Get.put<HomeRepositoryImpl>(
      HomeRepositoryImpl(
        BindsHelper.get<HomeRemoteDataSourceImpl>(),
        BindsHelper.get<HomeLocalDataSourceImpl>(),
      ),
    );

    // ================== USE CASES ============== //
    Get.put<GetListMainCitiesWithWeatherUseCase>(
      GetListMainCitiesWithWeatherUseCase(
        BindsHelper.get<HomeRepositoryImpl>(),
      ),
    );
    Get.put<GetWeatherForecastMainCitiesUseCase>(
      GetWeatherForecastMainCitiesUseCase(
        BindsHelper.get<HomeRepositoryImpl>(),
      ),
    );
    // ================ CONTROLLER =============== //
    Get.put<HomeController>(
      HomeController(
        BindsHelper.get<GetListMainCitiesWithWeatherUseCase>(),
        BindsHelper.get<GetWeatherForecastMainCitiesUseCase>(),
      ),
    );
  }
}
