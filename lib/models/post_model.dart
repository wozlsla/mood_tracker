import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mood_tracker/widgets/emotion.dart';

class PostModel {
  final String uid;
  final String body;
  final Emotion emotion;
  final Timestamp createdAt;

  PostModel({
    required this.uid,
    required this.body,
    required this.emotion,
    required this.createdAt,
  });

  // from db
  PostModel.fromJson(Map<String, dynamic> json)
    : uid = json["userId"],
      body = json["body"],
      emotion = Emotion.formKey((json["emotion"] ??= "")) ?? Emotion.excellent,
      createdAt = json["createdAt"];

  // to db
  Map<String, Object?> toJson() => {
    "uid": uid,
    "body": body,
    "emotion": emotion.key,
    "createdAt": createdAt,
  };
}
