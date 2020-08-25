import 'package:flutter/foundation.dart';
import 'package:we_grow/core/base/base_view_model.dart';
import 'package:we_grow/core/locator.dart';
import 'package:we_grow/core/routing/route_names.dart';
import 'package:we_grow/core/services/authentication_service.dart';
import 'package:we_grow/core/services/dialog_service.dart';
import 'package:we_grow/core/services/navigator_service.dart';
import 'package:we_grow/views/start_up/start_up_view.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigatorService _navigatorService = locator<NavigatorService>();

  Future gotoSignUpView() {
    _navigatorService.navigateTo(SignUpViewRoute);
  }

  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmail(
        email: email, password: password);

    setBusy(false);

    if (result is bool) {
      if (result) {
        // _navigatorService.navigateTo(HomeViewRoute);
        _navigatorService.navigateTo(StartUpViewRoute);
      } else {
        await _dialogService.showDialog(
          title: "Failed to Login",
          description: "Generic Login Error: Please try again later.",
        );
      }
    } else {
      await _dialogService.showDialog(
        title: "Failed to Login",
        description: result,
      );
    }
  }
}
