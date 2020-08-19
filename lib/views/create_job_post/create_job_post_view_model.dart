import 'package:flutter/foundation.dart';
import 'package:we_grow/core/base/base_view_model.dart';
import 'package:we_grow/core/locator.dart';
import 'package:we_grow/core/models/job_post.dart';
import 'package:we_grow/core/services/dialog_service.dart';
import 'package:we_grow/core/services/firestore_service.dart';
import 'package:we_grow/core/services/navigator_service.dart';

class CreateJobPostViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigatorService _navigatorService = locator<NavigatorService>();

  JobPost _editingPost;

  void setEdittingPost(JobPost post) {
    _editingPost = post;
  }

  bool get _editing => _editingPost != null;

  Future addPost({
    @required String title,
    String description,
    @required double payRate,
  }) async {
    setBusy(true);
    var result;
    if (!_editing) {
      print(currentUser.id);
      result = await _firestoreService.createJobPost(JobPost(
          title: title,
          description: description,
          payRate: payRate,
          userId: currentUser.id));
    } else {
      result = await _firestoreService.updateJobPost(JobPost(
          title: title,
          description: description,
          payRate: payRate,
          userId: _editingPost.userId,
          documentId: _editingPost.documentId));
    }

    setBusy(false);

    if (result is String) {
      await _dialogService.showDialog(
        title: "Unable to add Job Post",
        description: result,
      );
    } else {
      await _dialogService.showDialog(
        title: "Success",
        description: "Job  post  has been created",
      );
    }

    _navigatorService.pop();
  }
}
