import 'package:flutter/material.dart';
import 'package:todo_list_app/core/constants/app_colors.dart';
import 'package:todo_list_app/core/constants/app_dimensions.dart';
import 'package:todo_list_app/core/constants/app_strings.dart';
import 'package:todo_list_app/core/utils/validators.dart';
import 'package:todo_list_app/presentation/widgets/buttons/custom_elevated_button.dart';
import 'package:todo_list_app/presentation/widgets/buttons/custom_text_button.dart';
import 'package:todo_list_app/presentation/widgets/inputs/custom_text_form_field.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onLogin;
  final VoidCallback onRegister;

  const LoginForm({
    super.key,
    required this.onLogin,
    required this.onRegister,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.lock_outline,
              size: 80,
              color: AppColors.primary,
            ),
            const SizedBox(height: 16),
            const Text(
              AppStrings.welcome,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textTitle,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              AppStrings.loginToContinue,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSubtitle,
              ),
            ),
            const SizedBox(height: 32),
            CustomTextFormField(
              controller: _emailController,
              labelText: AppStrings.email,
              hintText: AppStrings.enterEmail,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email_outlined),
              textInputAction: TextInputAction.next,
              validator: Validators.email,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              controller: _passwordController,
              labelText: AppStrings.password,
              hintText: AppStrings.enterPassword,
              obscureText: _obscurePassword,
              prefixIcon: const Icon(Icons.lock_outline),
              textInputAction: TextInputAction.done,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              validator: Validators.password,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: CustomElevatedButton(
                onPressed: _submit,
                text: AppStrings.login,
              ),
            ),
            const SizedBox(height: 16),
            CustomTextButton(
              onPressed: widget.onRegister,
              text: AppStrings.forgotPasswordLink,
            ),
          ],
        ),
      ),
    );
  }
}
