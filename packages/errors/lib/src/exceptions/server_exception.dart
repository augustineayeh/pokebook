import 'exceptions.dart';

class ServerException extends AppException {
  const ServerException({required this.errorMessage})
      : super(errorMessage: errorMessage);
  final String errorMessage;

  @override
  String toString() {
    return this.errorMessage;
  }
}
