import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/router.dart';

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: "Mood Tracker",
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: Color(0xFF209BC4)),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(primary: Color(0xFF209BC4)),
      ),
    );
  }
}
