part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState({this.themeColor = AppColors.pink});
  final Color themeColor;
  @override
  List<Object> get props => [themeColor];
}
