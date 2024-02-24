import 'package:errors/src/errors.dart';

class CacheFailure extends Failure {
  const CacheFailure({
    required this.errorMessage,
  }) : super(
          errorMessage: errorMessage,
        );
  @override
  final String errorMessage;

  @override
  List<Object> get props => [
        errorMessage,
      ];
}
