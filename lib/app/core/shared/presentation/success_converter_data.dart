import 'package:pokedex_app/app/core/shared/presentation/ui_state.dart';

class SuccessConverterData<T> {
  T call(Success<T> data) {
    return data.value;
  }
}
