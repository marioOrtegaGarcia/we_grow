import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:we_grow/core/locator.dart';
import 'package:we_grow/core/models/job_post.dart';
import 'package:we_grow/core/models/user.dart';
import 'package:we_grow/core/services/authentication_service.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("users");
  final CollectionReference _jobPostsCollectionReference =
      Firestore.instance.collection("job_posts");
  final StreamController<List<JobPost>> _jobPostsController =
      StreamController<List<JobPost>>.broadcast();

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (err) {
      return err.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (err) {
      return err.message;
    }
  }

  Future updateUser(User user) async {
    try {
      await _usersCollectionReference
          .document(user.id)
          .updateData(user.toJson());
    } catch (err) {
      return err.message;
    }
  }

  Future createJobPost(JobPost post) async {
    try {
      await _jobPostsCollectionReference.add(post.toMap());
      return true;
    } catch (err) {
      return err.toString();
    }
  }

  Future updateJobPost(JobPost post) async {
    try {
      await _jobPostsCollectionReference
          .document(post.documentId)
          .updateData(post.toMap());
      return true;
    } catch (err) {
      if (err is PlatformException) {
        return err.message;
      }

      return err.toString();
    }
  }

  Future deleteJobPost(String documentID) async {
    await _jobPostsCollectionReference.document(documentID).delete();
  }

  Future getJobPostsOnce() async {
    try {
      var job_posts = await _jobPostsCollectionReference.getDocuments();
      if (job_posts.documents.isNotEmpty) {
        return job_posts.documents
            .map((job) => JobPost.fromMap(job.data, job.documentID))
            .where((mapppedItem) => mapppedItem.title != null)
            .toList();
      }
    } catch (err) {
      if (err == PlatformException) {
        return err.message;
      }
      return err.toString();
    }
  }

  Stream listenToPostsRealTime() {
    _jobPostsCollectionReference.snapshots().listen((jobPostSnapshot) {
      if (jobPostSnapshot.documents.isNotEmpty) {
        var posts = jobPostSnapshot.documents
            .map((snapshot) =>
                JobPost.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedIted) => mappedIted.title != null)
            .toList();

        _jobPostsController.add(posts);
      }
    });

    return _jobPostsController.stream;
  }
}
