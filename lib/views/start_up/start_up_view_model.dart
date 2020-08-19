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

    if (userHasLoggedIn) {
      _navigatorService.navigateTo(HomeViewRoute);
    } else {
      _navigatorService.navigateTo(LoginViewRoute);
    }
  }
}
