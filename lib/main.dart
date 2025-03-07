import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/router.dart';
import 'package:mood_tracker/utils.dart';

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);

    return MaterialApp.router(
      routerConfig: router,
      title: "Mood Tracker",
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: Color(0xFF209BC4)),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFF209BC4),
          selectionColor: Color(0xFF209BC4).withValues(alpha: 0.6),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(primary: Color(0xFF209BC4)),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFF209BC4),
          selectionColor: Color(0xFF209BC4).withValues(alpha: 0.6),
        ),
      ),
    );
  }
}
