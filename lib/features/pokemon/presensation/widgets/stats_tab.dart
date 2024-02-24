import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../data/models/pokemon.dart';
import 'about_tab.dart';
import 'stat_tab_item.dart';
import 'tab_title.dart';

class StatsTab extends StatelessWidget {
  final Pokemon pokemon;
  const StatsTab({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const Gap(36),
          const TabTitleWidget(text: 'Stat'),
          const Divider(
            height: 0,
          ),
          StatTabItem(param: 'HP', value: pokemon.hp),
          const CustomDivider(),
          StatTabItem(param: 'Attack', value: pokemon.attack),
          const CustomDivider(),
          StatTabItem(param: 'Defense', value: pokemon.defense),
          const CustomDivider(),
          StatTabItem(param: 'Special Attack', value: pokemon.specialAttack),
          const CustomDivider(),
          StatTabItem(param: 'Special Defense', value: pokemon.specialDefense),
          const CustomDivider(),
          StatTabItem(param: 'Speed', value: pokemon.speed),
          const Divider(
            height: 0,
          ),
        ],
      ),
    );
  }
}
