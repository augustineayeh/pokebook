import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pokebook/core/constants/app_colors.dart';
import 'package:pokebook/features/pokemon/data/models/pokemon.dart';
import 'package:pokebook/features/pokemon/presensation/widgets/pokemon_type.dart';

class SimilarPokemonCard extends StatelessWidget {
  const SimilarPokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Positioned(
                  height: 240,
                  bottom: 0,
                  left: 40,
                  child: Image.network(
                    pokemon.imageUrl,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PokemonTypeWidget(text: pokemon.types[0]),
              const Gap(40),
              if (pokemon.types.length > 1)
                PokemonTypeWidget(text: pokemon.types[1]),
            ],
          ),
          const Gap(24),
          Text(
            pokemon.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Gap(24),
        ],
      ),
    );
  }
}
