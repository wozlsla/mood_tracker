import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/repos/auth_repo.dart';
import 'package:mood_tracker/router_constant.dart';
import 'package:mood_tracker/views/home_screen.dart';
import 'package:mood_tracker/views/login_screen.dart';
import 'package:mood_tracker/views/main_screen.dart';
import 'package:mood_tracker/views/profile_screen.dart';
import 'package:mood_tracker/views/signup_screen.dart';
import 'package:mood_tracker/views/write_screen.dart';
import 'package:mood_tracker/widgets/navigation_bar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteURL.home,

    // redirection
    redirect: (context, state) {
      final isLoggedIn = ref.watch(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.matchedLocation != RouteURL.signup &&
            state.matchedLocation != RouteURL.login) {
          return RouteURL.main;
        }
      }
      return null;
    },

    routes: [
      GoRoute(
        name: RouteName.main,
        path: RouteURL.main,
        builder: (context, state) => MainScreen(),
      ),
      GoRoute(
        name: RouteName.signup,
        path: RouteURL.signup,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        name: RouteName.login,
        path: RouteURL.login,
        builder: (context, state) => LogInScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return CustomNavigationBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteName.home,
                path: RouteURL.home,
                builder: (context, state) => HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteName.write,
                path: RouteURL.write,
                builder: (context, state) => WriteScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteName.profile,
                path: RouteURL.profile,
                builder: (context, state) => ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
