import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/repos/auth_repo.dart';
import 'package:mood_tracker/view_models/user_vm.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ref
        .watch(userProvider)
        .when(
          data:
              (data) => Scaffold(
                body: Center(
                  child: TextButton(
                    onPressed: () {
                      ref.read(authRepo).signOut();
                      context.go("/");
                    },
                    style: TextButton.styleFrom(
                      side: BorderSide(color: Colors.grey),
                    ),
                    child: Text(
                      "Name: ${data.userName}\nLog Out",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ),
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () => Center(child: CircularProgressIndicator.adaptive()),
        );
  }
}
