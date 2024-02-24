import 'package:flutter/cupertino.dart';

import '../../../../core/constants/app_colors.dart';

class PokemonTypeWidget extends StatefulWidget {
  const PokemonTypeWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  State<PokemonTypeWidget> createState() => _PokemonTypeWidgetState();
}

class _PokemonTypeWidgetState extends State<PokemonTypeWidget> {
  String getEmoji(String text) {
    switch (text.toLowerCase()) {
      case 'poison':
        return '💀';
      case 'grass':
        return '🌿';
      case 'fire':
        return '🔥';
      case 'flying':
        return '🦋';
      case 'normal':
        return '🐻';
      case 'bug':
        return '🐞';
      case 'water':
        return '💧';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lightGrey, borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
      child: Text('${getEmoji(widget.text)}${widget.text}'),
    );
  }
}
