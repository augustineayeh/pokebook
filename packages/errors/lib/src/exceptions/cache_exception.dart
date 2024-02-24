import 'package:errors/errors.dart';

class CacheException implements AppException {
  final String errorMessage;

  const CacheException({
    required this.errorMessage,
  });
}
