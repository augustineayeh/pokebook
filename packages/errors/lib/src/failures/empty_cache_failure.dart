import 'package:errors/src/errors.dart';

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({
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
