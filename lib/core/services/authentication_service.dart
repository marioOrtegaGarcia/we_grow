import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:we_grow/core/locator.dart';
import 'package:we_grow/core/models/user.dart';
import 'package:we_grow/core/services/firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  User _currentUser;
  User get currentUser => _currentUser;

  dynamic _isPasswordCompliant(String password, String verifyPassword,
      [int minLength = 6]) {
    if (password == null ||
        password.isEmpty ||
        verifyPassword == null ||
        verifyPassword.isEmpty) {
      return "Passwords are empty";
    }
    String result = "";

    if (password != verifyPassword) {
      result += "Passowrds do not match\n";
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length >= minLength;

    if (hasDigits &
        hasUppercase &
        hasLowercase &
        hasSpecialCharacters &
        hasMinLength) {
      return true;
    } else {
      if (!hasDigits) result += "Missing minimum of 1 Numeric Character\n";
      if (!hasUppercase)
        result += "Missing minimum of 1 Upper-case Character\n";
      if (!hasLowercase)
        result += "Missing minimum of 1 Lower-case Character\n";
      if (!hasSpecialCharacters)
        result +=
            "Missing minimum of 1 Special Character, Allowed Characters \(\!\@\#\$\&\*\~\)\n";
      if (!hasMinLength) result += "Requires minimum length of 6 characters";
    }
    return result;
  }

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user);
      return authResult != null;
    } catch (err) {
      return err.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String verifyPassword,
  }) async {
    var res = _isPasswordCompliant(password, verifyPassword);
    if (res is String) {
      return res;
    }

    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _currentUser = User(
        id: authResult.user.uid,
        email: email,
      );

      try {
        await _firestoreService.createUser(_currentUser);
      } catch (err) {
        return err.message;
      }

      return authResult.user != null;
    } catch (err) {
      return err.message;
    }
  }

  Future updateUser({String email, String role, String image}) async {
    var user;
    user = _currentUser;
    if (email != null) user.email = email;
    if (role != null) user.role = role;

    _firestoreService.updateUser(user);
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    await _populateCurrentUser(user);
    if (user != await _firebaseAuth.currentUser()) {
      print(
          "Suss activies,  this seems to be happening when I idle with debug open for too long");
    }
    return user != null;
  }

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      var getUserResult = await _firestoreService.getUser(user.uid);
      if (getUserResult is String) {
        print(getUserResult);
        return getUserResult;
      }
      _currentUser = getUserResult;
    }
  }

  Future logOutUser() => _firebaseAuth.signOut();
}
