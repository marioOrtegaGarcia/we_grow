import 'package:we_grow/core/base/base_view_model.dart';
import 'package:we_grow/core/locator.dart';
import 'package:we_grow/core/routing/route_names.dart';
import 'package:we_grow/core/services/authentication_service.dart';
import 'package:we_grow/core/services/navigator_service.dart';

class ProfileViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  // final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigatorService _navigatorService = locator<NavigatorService>();
  ProfileViewModel();

  String getUserFullName() {
    return _authenticationService.currentUser.firstName +
        " " +
        _authenticationService.currentUser.lastName;
  }

  void logout() {
    this._authenticationService.logOutUser();
    _navigatorService.navigateTo(LoginViewRoute);
  }

  // Add ViewModel specific code here
}
