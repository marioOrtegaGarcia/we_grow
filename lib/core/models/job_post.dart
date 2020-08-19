import 'package:flutter/foundation.dart';

class JobPost {
  final String title;
  final String description;
  final double payRate;
  final String imageUrl;
  final String userId;
  final String documentId;

  JobPost({
    @required this.title,
    @required this.payRate,
    @required this.userId,
    this.description,
    this.imageUrl,
    this.documentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'title': this.title,
      'description': this.description,
      'imageUrl': this.imageUrl,
      'payRate': this.payRate,
    };
  }

  static JobPost fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return JobPost(
      title: map['title'],
      description: map['description'],
      payRate: map['payRate'],
      imageUrl: map['imageUrl'],
      userId: map['userId'],
      documentId: documentId,
    );
  }
}
