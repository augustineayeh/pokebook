import 'package:errors/errors.dart';

class EmptyCacheException implements AppException {
  final String errorMessage;

  const EmptyCacheException({
    required this.errorMessage,
  });
}
