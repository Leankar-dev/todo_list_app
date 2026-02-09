abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalError;

  const AppException({
    required this.message,
    this.code,
    this.originalError,
  });

  @override
  String toString() => 'AppException: $message (code: $code)';
}

class DatabaseException extends AppException {
  const DatabaseException({
    required super.message,
    super.code,
    super.originalError,
  });
}

class AuthException extends AppException {
  const AuthException({
    required super.message,
    super.code,
    super.originalError,
  });
}

class ValidationException extends AppException {
  final Map<String, String>? fieldErrors;

  const ValidationException({
    required super.message,
    super.code,
    super.originalError,
    this.fieldErrors,
  });
}

class NotFoundException extends AppException {
  const NotFoundException({
    required super.message,
    super.code,
    super.originalError,
  });
}

class NetworkException extends AppException {
  const NetworkException({
    required super.message,
    super.code,
    super.originalError,
  });
}

class UnknownException extends AppException {
  const UnknownException({
    super.message = 'Ocorreu um erro desconhecido',
    super.code,
    super.originalError,
  });
}
