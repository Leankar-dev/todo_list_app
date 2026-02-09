import 'package:flutter/material.dart';
import 'package:todo_list_app/presentation/pages/auth/login/login_page.dart';
import 'package:todo_list_app/presentation/pages/auth/register/widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  void _register(BuildContext context) {
    // TODO: Implementar lógica de registro
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  void _goToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
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
            child: RegisterForm(
              onRegister: () => _register(context),
              onGoToLogin: () => _goToLogin(context),
            ),
          ),
        ),
      ),
    );
  }
}
