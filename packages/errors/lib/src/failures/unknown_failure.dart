import 'package:errors/src/errors.dart';

class UnknownFailure extends Failure {
  const UnknownFailure({
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
