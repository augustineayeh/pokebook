import 'package:errors/errors.dart';

class NoInternetFailure extends Failure {
  const NoInternetFailure({
    required this.errorMessage,
  }) : super(
          errorMessage: errorMessage,
        );
  @override
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
