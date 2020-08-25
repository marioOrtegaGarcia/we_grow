import 'package:flutter/foundation.dart';
import 'package:we_grow/core/base/base_view_model.dart';
import 'package:we_grow/core/locator.dart';
import 'package:we_grow/core/models/user.dart';
import 'package:we_grow/core/routing/route_names.dart';
import 'package:we_grow/core/services/authentication_service.dart';
import 'package:we_grow/core/services/firestore_service.dart';
import 'package:we_grow/core/services/navigator_service.dart';

class CreateUserInformationViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _firestoreService = locator<FirestoreService>();
  final _navigatorService = locator<NavigatorService>();

  String _selectedRole = 'Select desired Role.';
  String get selectedRole => _selectedRole;

  void setSelectedRole(dynamic role) {
    _selectedRole = role;
    notifyListeners();
  }

  Future updateUserInfo({
    @required String firstName,
    @required String lastName,
    @required String prefferedDriveDistance,
  }) async {
    var user = await _authenticationService.currentUser.toJson();
    user['firstName'] = firstName;
    user['lastName'] = lastName;
    user['prefferedDriveDistance'] = int.parse(prefferedDriveDistance);
    if (!_selectedRole.contains("Select")) {
      user['userRole'] = _selectedRole;
    }
    var result = await _firestoreService.updateUser(User.fromData(user));

    if (result is String) {
      log.e(result);
    }

    _navigatorService.navigateTo(HomeViewRoute);
  }
  // Add ViewModel specific code here
}
