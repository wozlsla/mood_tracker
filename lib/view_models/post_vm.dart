import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/models/post_model.dart';
import 'package:mood_tracker/repos/auth_repo.dart';
import 'package:mood_tracker/repos/post_repo.dart';
import 'package:mood_tracker/widgets/emotion.dart';

class PostViewModel extends StreamNotifier<List<PostModel>> {
  // late final UserRepository _repository;

  @override
  Stream<List<PostModel>> build() {
    // _repository = ref.read(userRepo);

    return getPosts();
  }

  Stream<List<PostModel>> getPosts() {
    return ref.read(postRepo).getPosts();
  }

  Future<void> uploadPost({
    required String body,
    required Emotion emotion,
  }) async {
    state = AsyncValue.loading();

    final userId = ref.read(authRepo).user!.uid;

    state = await AsyncValue.guard(() async {
      //  final imageUrl = files != null
      //      ? await Future.wait(
      //          files.map((file) async {
      //            return await _repository.uploadThread(file, authorId);
      //          }),
      //        )
      //      : null;
      await ref
          .read(postRepo)
          .createPost(uid: userId, body: body, emotion: emotion);

      throw ("todo");
    });
  }

  Future<void> deletePost(String postId) async {
    try {
      await ref.read(postRepo).deletePost(postId);
    } catch (e) {
      print("Error deleting post: $e");
    }
  }
}

final postProvider = StreamNotifierProvider<PostViewModel, List<PostModel>>(
  () => PostViewModel(),
);
