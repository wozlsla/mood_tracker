import 'package:go_router/go_router.dart';
import 'package:mood_tracker/views/home_screen.dart';

final router = GoRouter(
  initialLocation: HomeScreen.routeURL,
  routes: [
    GoRoute(
      path: HomeScreen.routeURL,
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
