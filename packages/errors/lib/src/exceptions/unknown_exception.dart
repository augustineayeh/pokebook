class UnknownException implements Exception {
  final String errorMessage;

  const UnknownException({
    required this.errorMessage,
  });
}
