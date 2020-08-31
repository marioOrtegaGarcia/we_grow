import 'package:we_grow/core/services/dialog_service.dart';
import 'package:we_grow/views/start_up/start_up_view.dart';

import 'core/locator.dart';
import 'core/manager/dialog_manager.dart';
import 'core/providers.dart';
import 'core/routing/router.dart';
import 'core/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocatorInjector.setupLocator();
  runApp(MainApplication());
}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInjector.providers,
      child: MaterialApp(
        // debugShowCheckedModeBanner: false,
        title: "WeGrow",
        builder: (context, child) => Navigator(
          key: locator<DialogService>().dialogNavigationKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => DialogManager(child: child)),
        ),
        navigatorKey: locator<NavigatorService>().navigationKey,
        theme: ThemeData(
          primaryColor: Color(0xFF292929),
          accentColor: Color(0xFF24ABBC),
        ),
        home: StartUpView(),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
