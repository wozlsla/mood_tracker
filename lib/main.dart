import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/firebase_options.dart';
import 'package:mood_tracker/router.dart';
import 'package:mood_tracker/utils.dart';

void main() async {
  GoRouter.optionURLReflectsImperativeAPIs = true;

  WidgetsFlutterBinding.ensureInitialized(); // Flutter 초기화
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await dotenv.load(); // .env 파일 로드

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = isDarkMode(context);

    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
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
