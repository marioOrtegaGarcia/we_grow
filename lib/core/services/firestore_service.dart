import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:we_grow/core/models/job_post.dart';
import 'package:we_grow/core/models/user.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference _jobPostsCollectionReference =
      FirebaseFirestore.instance.collection("job_posts");
  final StreamController<List<JobPost>> _jobPostsController =
      StreamController<List<JobPost>>.broadcast();

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (err) {
      if (err is ArgumentError) {
        return err.toString();
      }
      return err.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.doc(uid).get();
      return User.fromData(userData.data());
    } catch (err) {
      if (err is PlatformException) {
        return err.message;
      }
      return err.toString();
    }
  }

  Future updateUser(User user) async {
    try {
      await _usersCollectionReference.doc(user.id).update(user.toJson());
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
          .doc(post.documentId)
          .update(post.toMap());
      return true;
    } catch (err) {
      if (err is PlatformException) {
        return err.message;
      }

      return err.toString();
    }
  }

  Future deleteJobPost(String documentID) async {
    await _jobPostsCollectionReference.doc(documentID).delete();
  }

  Future getJobPostsOnce() async {
    try {
      var jobPosts = await _jobPostsCollectionReference.get();
      if (jobPosts.docs.isNotEmpty) {
        return jobPosts.docs
            .map((job) => JobPost.fromMap(job.data(), job.id))
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
      if (jobPostSnapshot.docs.isNotEmpty) {
        var posts = jobPostSnapshot.docs
            .map((snapshot) => JobPost.fromMap(snapshot.data(), snapshot.id))
            .where((mappedIted) => mappedIted.title != null)
            .toList();

        _jobPostsController.add(posts);
      }
    });

    return _jobPostsController.stream;
  }
}
