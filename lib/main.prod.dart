import 'package:pokedex_app/app/core/config/build_config.dart';
import 'package:pokedex_app/app/core/storage/config/hive_initializer.dart';
import 'package:pokedex_app/app/run_app.dart';

void main() async {
  await HiveInitializer.call();
  BuildConfig.baseProduction();
  RunApp.init();
}
