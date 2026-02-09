import 'package:flutter/material.dart';
import 'package:todo_list_app/presentation/pages/home/home_page.dart';
import 'package:todo_list_app/presentation/pages/auth/register/register_page.dart';
import 'package:todo_list_app/presentation/pages/auth/login/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _login(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void _register(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: LoginForm(
              onLogin: () => _login(context),
              onRegister: () => _register(context),
            ),
          ),
        ),
      ),
    );
  }
}
