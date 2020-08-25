import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:we_grow/core/base/base_view_model.dart';
import 'package:we_grow/core/locator.dart';
import 'package:we_grow/core/routing/route_names.dart';
import 'package:we_grow/core/services/authentication_service.dart';
import 'package:we_grow/core/services/dialog_service.dart';
import 'package:we_grow/core/services/navigator_service.dart';

class SignUpViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigatorService _navigatorService = locator<NavigatorService>();

  Future signUp({
    @required String email,
    @required String password,
    @required String verifyPassword,
    // @required String full_name,
  }) async {
    setBusy(true);

    var result = await _authenticationService.signUpWithEmail(
      email: email,
      password: password,
      verifyPassword: verifyPassword,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigatorService.navigateTo(CreateUserInformationViewRoute);
      } else {
        await _dialogService.showDialog(
            title: "Failed to Sign Up",
            description: "Generic Sign Up Error: Please try again later.");
      }
    } else {
      await _dialogService.showDialog(
          title: "Failed to Sign Up", description: result);
    }
  }
}
