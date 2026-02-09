import 'package:flutter/material.dart';
import 'package:todo_list_app/core/constants/app_colors.dart';
import 'package:todo_list_app/core/constants/app_strings.dart';
import 'package:todo_list_app/core/utils/validators.dart';
import 'package:todo_list_app/presentation/pages/auth/register/controller/register_controller.dart';
import 'package:todo_list_app/presentation/widgets/buttons/custom_elevated_button.dart';
import 'package:todo_list_app/presentation/widgets/buttons/custom_text_button.dart';
import 'package:todo_list_app/presentation/widgets/inputs/custom_text_form_field.dart';

class RegisterForm extends StatefulWidget {
  final VoidCallback onRegister;
  final VoidCallback onGoToLogin;

  const RegisterForm({
    super.key,
    required this.onRegister,
    required this.onGoToLogin,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _controller = RegisterController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (_controller.formKey.currentState!.validate()) {
      widget.onRegister();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _controller.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.person_add_outlined,
              size: 80,
              color: AppColors.primary,
            ),
            const SizedBox(height: 16),
            const Text(
              AppStrings.register,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textTitle,
              ),
            ),
            const SizedBox(height: 32),
            CustomTextFormField(
              controller: _controller.nameController,
              labelText: AppStrings.name,
              hintText: AppStrings.enterName,
              keyboardType: TextInputType.name,
              prefixIcon: const Icon(Icons.person_outline),
              textInputAction: TextInputAction.next,
              validator: Validators.required,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              controller: _controller.emailController,
              labelText: AppStrings.email,
              hintText: AppStrings.enterEmail,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email_outlined),
              textInputAction: TextInputAction.next,
              validator: Validators.email,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              controller: _controller.passwordController,
              labelText: AppStrings.password,
              hintText: AppStrings.enterPassword,
              obscureText: _controller.obscurePassword,
              prefixIcon: const Icon(Icons.lock_outline),
              textInputAction: TextInputAction.next,
              suffixIcon: IconButton(
                icon: Icon(
                  _controller.obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _controller.toggleObscurePassword();
                  });
                },
              ),
              validator: Validators.password,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              controller: _controller.confirmPasswordController,
              labelText: AppStrings.confirmPassword,
              hintText: AppStrings.enterPassword,
              obscureText: _controller.obscureConfirmPassword,
              prefixIcon: const Icon(Icons.lock_outline),
              textInputAction: TextInputAction.done,
              suffixIcon: IconButton(
                icon: Icon(
                  _controller.obscureConfirmPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _controller.toggleObscureConfirmPassword();
                  });
                },
              ),
              validator: (value) => Validators.confirmPassword(
                value,
                _controller.passwordController.text,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: CustomElevatedButton(
                onPressed: _submit,
                text: AppStrings.register,
              ),
            ),
            const SizedBox(height: 16),
            CustomTextButton(
              onPressed: widget.onGoToLogin,
              text: AppStrings.alreadyHaveAccount,
            ),
          ],
        ),
      ),
    );
  }
}
