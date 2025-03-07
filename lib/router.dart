import 'package:go_router/go_router.dart';
import 'package:mood_tracker/views/home_screen.dart';
import 'package:mood_tracker/views/login_screen.dart';
import 'package:mood_tracker/views/main_screen.dart';
import 'package:mood_tracker/views/signup_screen.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      name: MainScreen.routeName,
      path: MainScreen.routeURL,
      builder: (context, state) => MainScreen(),
    ),
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      name: LogInScreen.routeName,
      path: LogInScreen.routeURL,
      builder: (context, state) => LogInScreen(),
    ),
    GoRoute(
      name: HomeScreen.routeName,
      path: HomeScreen.routeURL,
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
