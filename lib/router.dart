import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/repos/auth_repo.dart';
import 'package:mood_tracker/views/home_screen.dart';
import 'package:mood_tracker/views/login_screen.dart';
import 'package:mood_tracker/views/main_screen.dart';
import 'package:mood_tracker/views/signup_screen.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/home",

    // redirection
    redirect: (context, state) {
      final isLoggedIn = ref.watch(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.matchedLocation != SignUpScreen.routeURL &&
            state.matchedLocation != LogInScreen.routeURL) {
          return MainScreen.routeURL;
        }
      }
      return null;
    },

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
});
