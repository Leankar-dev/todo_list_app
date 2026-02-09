import 'package:flutter/material.dart';
import 'package:todo_list_app/presentation/pages/auth/login/login_page.dart';
import 'package:todo_list_app/presentation/pages/auth/register/register_page.dart';
import 'package:todo_list_app/presentation/pages/home/home_page.dart';
import 'package:todo_list_app/routes/app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case AppRoutes.register:
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
    }
  }
}
