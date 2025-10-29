import 'package:authority_tracker/config/route/route_names.dart';
import 'package:authority_tracker/presentation/views/authentication_section/login_screen.dart/login_screen.dart';
import 'package:authority_tracker/presentation/views/authentication_section/signup_screen/signup_screen.dart';
import 'package:authority_tracker/presentation/views/authentication_section/splash_screen/splash_screen.dart';
import 'package:authority_tracker/presentation/views/main_section/home_screen/home_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouteConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRouteNames.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: AppRouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signUp',
        name: AppRouteNames.signUp,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/home',
        name: AppRouteNames.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
