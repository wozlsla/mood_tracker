import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/models/post_model.dart';
import 'package:mood_tracker/widgets/emotion.dart';

class PostRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createPost({
    required String uid,
    required String body,
    required Emotion emotion,
  }) async {
    try {
      await _db.collection("posts").add({
        "userId": uid,
        "body": body,
        "emotion": emotion.key,
        "createdAt": FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<PostModel>> getPosts() {
    return _db
        .collection("posts")
        .orderBy("createdAt", descending: true)
        .snapshots()
        .map(
          (event) =>
              event.docs.map((doc) => PostModel.fromJson(doc.data())).toList(),
        );
  }
}

final postRepo = Provider((ref) => PostRepository());
