abstract class AppException implements Exception {
  const AppException({required this.errorMessage});
  final String errorMessage;
}
