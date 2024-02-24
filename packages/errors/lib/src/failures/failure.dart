import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
