import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pokedex_app/app/core/binds/app_binds.dart';
import 'package:pokedex_app/app/core/l10n/l10n.dart';
import 'package:pokedex_app/app/core/router/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pokedex_app/app/core/router/routes_path.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokedex APP',
      initialBinding: AppBinds(),
      initialRoute: RoutesPath.home,
      getPages: Routes.getPages,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
    );
  }
}
