import 'package:we_grow/core/base/base_view_model.dart';
import 'package:we_grow/core/locator.dart';
import 'package:we_grow/core/routing/route_names.dart';
import 'package:we_grow/core/services/authentication_service.dart';
import 'package:we_grow/core/services/navigator_service.dart';

class StartUpViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigatorService _navigatorService = locator<NavigatorService>();

  Future handleStartupLogic() async {
    var userHasLoggedIn = await _authenticationService.isUserLoggedIn();
    var user = _authenticationService.currentUser;

    if (user == null) userHasLoggedIn = false;

    if (userHasLoggedIn &&
        (user.userRole == "Admin" ||
            user.userRole == "Farmer" ||
            user.userRole == "Worker")) {
      log.e("StartUpView: User found & profile is set up");
      _navigatorService.navigateTo(HomeViewRoute);
    } else if (userHasLoggedIn && user.userRole == "") {
      log.e("StartUpView: User found & no profile is set up");
      _navigatorService.navigateTo(CreateUserInformationViewRoute);
    } else {
      log.e("StatUpView: User not logged in");
      _navigatorService.navigateTo(LoginViewRoute);
    }
  }
}
