import 'package:flutter/material.dart';
import 'package:weather_app/app/app_widget.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/app/core/storage/main_cities/main_cities_reader.dart';
import 'package:weather_app/app/core/storage/main_cities/main_cities_writer.dart';
import 'core/storage/config/hive_initializer.dart';

abstract class RunApp {
  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await HiveInitializer.call();
    await MainCitiesReader.getInstance().initializeBox();
    await MainCitiesWriter.getInstance().initializeBox();
    Intl.defaultLocale = 'pt_BR';
    runApp(
      const App(),
    );
  }
}
