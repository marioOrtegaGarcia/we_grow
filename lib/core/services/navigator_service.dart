import '../../core/base/base_service.dart';
import 'package:flutter/material.dart';

class NavigatorService extends BaseService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void pop<T>([T result]) {
    log.i('goBack:');
    if (_navigationKey.currentState == null) {
      log.e('goBack: Navigator State is null');
      return;
    }
    _navigationKey.currentState.pop(result);
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) async {
    log.i('navigateToPage: pageRoute: $routeName');
    if (_navigationKey.currentState == null) {
      log.e('navigateToPage: Navigator State is null');
      return null;
    }
    return _navigationKey.currentState
        .pushNamed(routeName, arguments: arguments);
  }

  // Future<T> navigateToPageWithReplacement<T>(
  //     MaterialPageRoute<T> pageRoute) async {
  //   log.i('navigateToPageWithReplacement: '
  //       'pageRoute: ${pageRoute.settings.name}');
  //   if (_navigationKey.currentState == null) {
  //     log.e('navigateToPageWithReplacement: Navigator State is null');
  //     return null;
  //   }
  //   return _navigationKey.currentState.pushReplacement(pageRoute);
  // }

}
