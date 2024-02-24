import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/theme_cubit/theme_cubit.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    Key? key,
    required this.scale,
  }) : super(key: key);
  final double scale;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return RichText(
          text: TextSpan(
            text: 'Poké',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: state.themeColor,
                fontSize: 24 * scale),
            children: const <TextSpan>[
              TextSpan(
                  text: 'book',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ],
          ),
        );
      },
    );
  }
}
