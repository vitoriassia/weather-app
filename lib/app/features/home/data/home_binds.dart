import 'package:get/instance_manager.dart';
import 'package:pokedex_app/app/core/binds/binds_helper.dart';
import 'package:pokedex_app/app/core/services/api/api_service_impl.dart';
import 'package:pokedex_app/app/features/home/data/home_remote_data_source_impl.dart';
import 'package:pokedex_app/app/features/home/data/home_repository_impl.dart';
import 'package:pokedex_app/app/features/home/domain/useCases/get_list_assets_use_case.dart';
import 'package:pokedex_app/app/features/home/presentation/controllers/home_controller.dart';

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
    Get.put<GetListPokemonsUseCase>(
      GetListPokemonsUseCase(
        BindsHelper.get<HomeRepositoryImpl>(),
      ),
    );
    // ================ CONTROLLER =============== //
    Get.put<HomeController>(
      HomeController(
        BindsHelper.get<GetListPokemonsUseCase>(),
      ),
    );
  }
}
