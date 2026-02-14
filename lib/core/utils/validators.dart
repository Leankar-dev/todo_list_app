import 'package:todo_list_app/core/constants/app_strings.dart';

abstract class Validators {
  static String? required(String? value) => switch (value?.trim()) {
        null || '' => AppStrings.requiredField,
        _ => null,
      };

  static String? email(String? value) => switch (value?.trim()) {
        null || '' => AppStrings.pleaseEnterEmail,
        final v when !RegExp(
              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
            ).hasMatch(v) =>
          AppStrings.enterValidEmail,
        _ => null,
      };

  static String? password(String? value) => switch (value) {
        null || '' => AppStrings.pleaseEnterPassword,
        final v when v.length < 6 => AppStrings.passwordTooShort,
        _ => null,
      };

  static String? confirmPassword(String? value, String? password) =>
      switch (value) {
        null || '' => AppStrings.requiredField,
        final v when v != password => AppStrings.passwordsDontMatch,
        _ => null,
      };

  static String? minLength(String? value, int minLength) => switch (value) {
        null || '' => AppStrings.requiredField,
        final v when v.length < minLength =>
          'Minimo de $minLength caracteres',
        _ => null,
      };

  static String? maxLength(String? value, int maxLength) => switch (value) {
        final v? when v.length > maxLength =>
          'Maximo de $maxLength caracteres',
        _ => null,
      };

  static String? combine(List<String? Function()> validators) {
    for (final validator in validators) {
      if (validator() case final error?) {
        return error;
      }
    }
    return null;
  }
}
