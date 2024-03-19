import 'package:get/get.dart';
import 'package:weather_app/app/core/shared/domain/entities/lat_lng_entity.dart';
import 'package:weather_app/app/core/shared/presentation/message_to_failure_converter/failure_to_message_converter_factory.dart';
import 'package:weather_app/app/core/shared/presentation/ui_state.dart';
import 'package:weather_app/app/features/home/domain/entities/main_city_entity.dart';
import 'package:weather_app/app/features/home/domain/useCases/get_list_main_events_use_case.dart';

class HomeController extends GetxController {
  // --- USECASES --- //
  final GetListMainCitiesWithWeatherUseCase
      _getListMainCitiesWithWeatherUseCase;
  HomeController(this._getListMainCitiesWithWeatherUseCase);

  // -- ATRIBUTES --- //
  final Rx<UiState> _uiState = Rx<UiState>(Initial());
  UiState get uiState => _uiState.value;

  final List<MainCityEntity> _defaultMainCities = const [
    MainCityEntity(
      name: 'Silverstone, UK',
      latLngEntity: LatLngEntity(
        latitude: 52.091660,
        longitude: -1.026140,
      ),
    ),
    MainCityEntity(
      name: 'São Paulo, Brazil',
      latLngEntity: LatLngEntity(
        latitude: -23.550520,
        longitude: -46.633308,
      ),
    ),
    MainCityEntity(
      name: 'Melbourne, Australia',
      latLngEntity: LatLngEntity(
        latitude: -37.813629,
        longitude: 144.963058,
      ),
    ),
    MainCityEntity(
      name: 'Monte Carlo, Monaco',
      latLngEntity: LatLngEntity(
        latitude: 43.740421,
        longitude: 7.425580,
      ),
    ),
  ];

  final RxList<MainCityEntity> _listCitiesWithWeather =
      RxList<MainCityEntity>();
  List<MainCityEntity> get listCitiesWithWeather => _listCitiesWithWeather;

  Future<void> getListCitiesWithWeather() async {
    _uiState.value = Loading();
    final result = await _getListMainCitiesWithWeatherUseCase(
      GetListMainCitiesWithWeatherParams(mainCities: _defaultMainCities),
    );

    _uiState.value = result.fold(
      (failure) => ErrorState(
        converter: FailureToMessageConverterFactory(failure)(),
        failure: failure,
      ),
      (success) {
        _listCitiesWithWeather.clear();
        _listCitiesWithWeather.addAll(success);
        return Success(success);
      },
    );
  }
}
