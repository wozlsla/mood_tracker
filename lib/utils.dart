import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

void showFirebaseErrorSnack(BuildContext context, Object? error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text((error as FirebaseException).message ?? "Something wrong."),
      showCloseIcon: true,
    ),
  );
}

String profileImage =
    "https://github.com/user-attachments/assets/129fec99-e2fa-4519-98ed-24cd0c51a6ea";
