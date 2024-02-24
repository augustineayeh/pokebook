import 'package:flutter/material.dart';

class ThemeSwitcherWidget extends StatelessWidget {
  const ThemeSwitcherWidget({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: isSelected ? Colors.black : Colors.transparent)),
      padding: const EdgeInsets.all(5),
      // margin: const EdgeInsets.only(right: 12),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
