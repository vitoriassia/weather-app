import 'package:get/get.dart';
import 'package:weather_app/app/core/shared/presentation/ui_state.dart';

class HomeController extends GetxController {
  // --- USECASES --- //

  HomeController();

  // -- ATRIBUTES --- //

  final Rx<UiState> _uiState = Rx<UiState>(Initial());
  UiState get uiState => _uiState.value;
}
