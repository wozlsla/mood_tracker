import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/models/user_profile_model.dart';
import 'package:mood_tracker/repos/auth_repo.dart';
import 'package:mood_tracker/repos/user_repo.dart';

class UserViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _userRepository;
  late final AuthenticationRepository _authenticationRepository;

  @override
  FutureOr<UserProfileModel> build() async {
    // await Future.delayed(Duration(microseconds: 200));
    _userRepository = ref.read(userRepo);
    _authenticationRepository = ref.read(authRepo);

    if (_authenticationRepository.isLoggedIn) {
      final profile = await _userRepository.getProfile(
        _authenticationRepository.user!.uid,
      );

      // db(json) -> user model
      if (profile != null) {
        return UserProfileModel.fromJson(profile);
      }
    }

    return UserProfileModel.empty();
  }

  Future<void> createProfile(UserCredential credential) async {
    if (credential.user == null) {
      throw Exception("Account not created");
    }

    state = AsyncValue.loading();

    final profile = UserProfileModel(
      uid: credential.user!.uid,
      userName: credential.user!.displayName ?? "Anon",
      avatar: "empty",
    );
    await _userRepository.createProfile(profile); // save data to db
    state = AsyncValue.data(profile);
  }
}

final userProvider = AsyncNotifierProvider<UserViewModel, UserProfileModel>(
  () => UserViewModel(),
);
