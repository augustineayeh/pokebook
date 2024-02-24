import 'package:equatable/equatable.dart';

class TabItemState extends Equatable {
  final int currentIndex;

  const TabItemState({this.currentIndex = 1});

  @override
  List<Object> get props => [currentIndex];
}
