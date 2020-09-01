import 'package:we_grow/core/services/dialog_service.dart';
import 'package:we_grow/core/services/firestore_service.dart';

import '../core/logger.dart';
import '../core/services/navigator_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'services/authentication_service.dart';

GetIt locator = GetIt.instance;

class LocatorInjector {
  static Logger _log = getLogger('LocatorInjector');

  static Future<void> setupLocator() async {
    _log.d('Initializing Navigator Service');
    locator.registerLazySingleton(() => NavigatorService());
    locator.registerLazySingleton(() => DialogService());
    locator.registerLazySingleton(() => AuthenticationService());
    locator.registerLazySingleton(() => FirestoreService());
  }
}
