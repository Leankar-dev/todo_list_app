import 'package:flutter/material.dart';
import 'package:todo_list_app/presentation/pages/auth/login/login_page.dart';
import 'package:todo_list_app/presentation/pages/auth/register/register_page.dart';
import 'package:todo_list_app/presentation/pages/home/home_page.dart';
import 'package:todo_list_app/routes/app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final page = switch (settings.name) {
      AppRoutes.login => const LoginPage(),
      AppRoutes.register => const RegisterPage(),
      AppRoutes.home => const HomePage(),
      _ => const LoginPage(),
    };

    return MaterialPageRoute(builder: (_) => page);
  }
}
