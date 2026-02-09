import 'package:todo_list_app/core/constants/app_strings.dart';

abstract class Validators {
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.requiredField;
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.pleaseEnterEmail;
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return AppStrings.enterValidEmail;
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.pleaseEnterPassword;
    }
    if (value.length < 6) {
      return AppStrings.passwordTooShort;
    }
    return null;
  }

  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return AppStrings.requiredField;
    }
    if (value != password) {
      return AppStrings.passwordsDontMatch;
    }
    return null;
  }

  static String? minLength(String? value, int minLength) {
    if (value == null || value.isEmpty) {
      return AppStrings.requiredField;
    }
    if (value.length < minLength) {
      return 'Minimo de $minLength caracteres';
    }
    return null;
  }

  static String? maxLength(String? value, int maxLength) {
    if (value != null && value.length > maxLength) {
      return 'Maximo de $maxLength caracteres';
    }
    return null;
  }

  static String? combine(List<String? Function()> validators) {
    for (final validator in validators) {
      final result = validator();
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}
