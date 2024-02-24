import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../data/models/pokemon.dart';
import 'about_tab_item.dart';
import 'tab_title.dart';

class AboutTab extends StatelessWidget {
  final Pokemon pokemon;
  const AboutTab({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(36),
        const TabTitleWidget(text: 'About'),
        const Divider(
          height: 0,
          thickness: 0.3,
        ),
        AboutTabItem(param: 'Height', value: '${pokemon.height}'),
        const CustomDivider(),
        AboutTabItem(param: 'Weight', value: '${pokemon.weight}'),
        const CustomDivider(),
        AboutTabItem(
            param: 'Abilities',
            value:
                '\u2022 ${pokemon.abilities[0]} \n\u2022 ${pokemon.abilities[1]}'),
        const Divider(
          height: 0,
          thickness: 0.3,
        ),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: Divider(
        height: 0,
        thickness: 0.3,
      ),
    );
  }
}
