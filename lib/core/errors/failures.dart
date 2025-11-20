abstract class Failure {
  final String code;
  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  const Failure({
    required this.code,
    required this.message,
    this.cause,
    this.stackTrace,
  });

  @override
  String toString() => 'Failure(code: $code, message: $message)';
}
