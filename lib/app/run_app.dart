import 'package:flutter/material.dart';
import 'package:pokedex_app/app/app_widget.dart';
import 'package:intl/intl.dart';

abstract class RunApp {
  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Intl.defaultLocale = 'pt_BR';
    runApp(
      const App(),
    );
  }
}
