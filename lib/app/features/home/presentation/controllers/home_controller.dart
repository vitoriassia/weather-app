import 'package:get/get.dart';
import 'package:weather_app/app/core/shared/presentation/ui_state.dart';
import 'package:weather_app/app/features/home/domain/useCases/get_list_main_events_use_case.dart';

class HomeController extends GetxController {
  // --- USECASES --- //
  final GetListMainCitiesWithWeatherUseCase getListMainCitiesWithWeatherUseCase;
  HomeController(this.getListMainCitiesWithWeatherUseCase);

  // -- ATRIBUTES --- //

  final Rx<UiState> _uiState = Rx<UiState>(Initial());
  UiState get uiState => _uiState.value;
}
