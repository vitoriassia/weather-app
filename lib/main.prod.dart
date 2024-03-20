import 'package:weather_app/app/core/config/build_config.dart';
import 'package:weather_app/app/run_app.dart';

void main() async {
  BuildConfig.baseProduction();
  RunApp.init();
}
