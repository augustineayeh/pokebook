import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokebook/core/constants/app_colors.dart';
import 'package:pokebook/features/pokemon/presensation/blocs/theme_cubit/theme_cubit.dart';
import 'package:pokebook/features/pokemon/presensation/widgets/theme_switcher_widget.dart';

class ThemeColors extends StatelessWidget {
  ThemeColors({super.key});
  final List<Color> themeColors = [
    AppColors.pink,
    AppColors.lightBlue,
    AppColors.amber
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: themeColors.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => context
              .read<ThemeCubit>()
              .onThemeSwitcherTapped(themeColors[index]),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return ThemeSwitcherWidget(
                    color: themeColors[index],
                    isSelected: state.themeColor == themeColors[index],
                  );
                },
              )),
        );
      },
    );
  }
}
