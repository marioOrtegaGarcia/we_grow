import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:we_grow/core/locator.dart';

import 'authentication_service.dart';

class FirebaseStorageService {
  final _authenticationService = locator<AuthenticationService>();
  final _storageReference =
      FirebaseStorage(storageBucket: "gs://wegrow-22ed7.appspot.com").ref();

  Future uploadImage(String path, File img) async {
    StorageReference filepath = _storageReference
        .child(path)
        .child(_authenticationService.currentUser.id);

    StorageUploadTask uploadTask = filepath.putFile(img);

    var downloadUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    return downloadUrl.toString();
  }
}
