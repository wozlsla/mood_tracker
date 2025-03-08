import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/repos/auth_repo.dart';
import 'package:mood_tracker/router_constant.dart';
import 'package:mood_tracker/utils.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }

  Future<void> signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = AsyncValue.loading();

    state = await AsyncValue.guard(
      () async => await _repository.emailSignUp(email, password),
    );

    if (context.mounted) {
      if (state.hasError) {
        final error = state.error;

        // email form, password check here
        if (error is FirebaseException) {
          showFirebaseErrorSnack(context, error);
        } else {
          showFirebaseErrorSnack(
            context,
            Exception("An unexpected error occurred."),
          );
        }
      } else {
        context.goNamed(RouteName.home);
      }
    }
  }
}

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
