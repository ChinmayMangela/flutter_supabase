abstract class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, {this.code});

  @override
  String toString() {
    return '$runtimeType Message: $message, Code: ${code != null ? '$code' : 'Unexpected-error'}';
  }
}
