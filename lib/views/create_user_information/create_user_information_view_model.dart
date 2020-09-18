import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:we_grow/core/base/base_view_model.dart';
import 'package:we_grow/core/locator.dart';
import 'package:we_grow/core/models/user.dart';
import 'package:we_grow/core/routing/route_names.dart';
import 'package:we_grow/core/services/authentication_service.dart';
import 'package:we_grow/core/services/firebase_storage.dart';
import 'package:we_grow/core/services/firestore_service.dart';
import 'package:we_grow/core/services/navigator_service.dart';

class CreateUserInformationViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _firestoreService = locator<FirestoreService>();
  final _navigatorService = locator<NavigatorService>();
  final _firebaseStorageService = locator<FirebaseStorageService>();

  String _selectedRole = 'Select desired Role.';
  String get selectedRole => _selectedRole;

  File _image;
  String _imageUrl = "";

  File get image => _image;

  void removeImage() {
    print("Clear image");
    _image = null;
    _imageUrl = "";
    notifyListeners();
  }

  void getImageFromUser(ImageSource source) async {
    var image = await ImagePicker.pickImage(source: source);
    if (image != null) {
      _image = image;
      _cropImage();
    } else {
      log.e("Error trying to get image");
    }
    notifyListeners();
  }

  Future<void> _cropImage() async {
    File croppedImage = await ImageCropper.cropImage(
      sourcePath: _image.path,
      maxWidth: 512,
      maxHeight: 512,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );

    _image = croppedImage ?? _image;
    notifyListeners();
  }

  void setSelectedRole(dynamic role) {
    _selectedRole = role;
    notifyListeners();
  }

  Future updateUserInfo({
    @required String firstName,
    @required String lastName,
    @required String prefferedDriveDistance,
  }) async {
    var user = _authenticationService.currentUser.toJson();
    user['firstName'] = firstName;
    user['lastName'] = lastName;
    user['prefferedDriveDistance'] = int.parse(prefferedDriveDistance);
    if (!_selectedRole.contains("Select")) {
      user['userRole'] = _selectedRole;
    }
    user['profilePictureUrl'] =
        await _firebaseStorageService.uploadImage("profilePicture/", _image);
    var result = await _firestoreService.updateUser(User.fromData(user));

    if (result is String) {
      log.e(result);
    }

    _navigatorService.navigateTo(HomeViewRoute);
  }
  // Add ViewModel specific code here
}
