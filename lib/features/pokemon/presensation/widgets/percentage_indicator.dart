import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/theme_cubit/theme_cubit.dart';

class CustomPercentageIndicator extends StatelessWidget {
  const CustomPercentageIndicator({
    Key? key,
    required this.value,
  }) : super(key: key);
  final int value;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              flex: (value / 10).round(),
              child: Container(
                color: state.themeColor,
                height: 10,
              ),
            ),
            Expanded(
              flex: 10 - (value / 10).round(),
              child: Container(
                color: Colors.grey,
                height: 10,
              ),
            )
          ],
        );
      },
    );
  }
}
