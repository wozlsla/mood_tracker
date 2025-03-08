import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/repos/auth_repo.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "2025.03",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            ref.read(authRepo).signOut();
            context.go("/");
          },
          style: TextButton.styleFrom(side: BorderSide(color: Colors.grey)),
          child: Text(
            "Redirection Test\nLog Out",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
