import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import '../pages/splash/splash_page.dart';
import '../pages/home/home_page.dart';
import '../pages/login/login_page.dart';

@lazySingleton
class AppRouter {
  late final GoRouter router;
  
  AppRouter() {
    router = GoRouter(
      initialLocation: AppRoutes.splash,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: AppRoutes.splash,
          name: AppRoutes.splash,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: AppRoutes.login,
          name: AppRoutes.login,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: AppRoutes.home,
          name: AppRoutes.home,
          builder: (context, state) => const HomePage(),
          routes: [
            // Add nested routes here
          ],
        ),
      ],
      errorBuilder: (context, state) => ErrorPage(error: state.error),
      redirect: (context, state) {
        // Add authentication logic here
        // Example:
        // final isAuthenticated = authService.isAuthenticated;
        // final isLoggingIn = state.matchedLocation == AppRoutes.login;
        // 
        // if (!isAuthenticated && !isLoggingIn) {
        //   return AppRoutes.login;
        // }
        // 
        // if (isAuthenticated && isLoggingIn) {
        //   return AppRoutes.home;
        // }
        
        return null;
      },
    );
  }
}

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  
  // Prevent instantiation
  const AppRoutes._();
}

class ErrorPage extends StatelessWidget {
  final Exception? error;
  
  const ErrorPage({super.key, this.error});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Oops! Something went wrong',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              error?.toString() ?? 'Unknown error',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
} 