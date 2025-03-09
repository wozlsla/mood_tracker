import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mood_tracker/models/emotion.dart';

class PostModel {
  final String uid;
  final String postId;
  final String body;
  final Emotion emotion;
  final Timestamp createdAt;

  PostModel({
    required this.uid,
    required this.postId,
    required this.body,
    required this.emotion,
    required this.createdAt,
  });

  // from db
  PostModel.fromJson({required Map<String, dynamic> json, required this.postId})
    : uid = json["userId"],
      body = json["body"],
      emotion = Emotion.formKey((json["emotion"] ??= "")) ?? Emotion.normal,
      createdAt =
          json["createdAt"] != null
              ? (json["createdAt"] as Timestamp)
              : Timestamp.now();

  // to db
  Map<String, Object?> toJson() => {
    "uid": uid,
    "body": body,
    "emotion": emotion.key,
    "createdAt": createdAt,
  };

  // get time
  String get timeAgo {
    final DateTime date = createdAt.toDate();
    final Duration difference = DateTime.now().difference(date);

    if (difference.inSeconds < 60) {
      return "${difference.inSeconds} s";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} m";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} h ago";
    } else {
      return "${difference.inDays} d ago";
    }
  }
}
