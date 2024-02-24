// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pokebook/core/constants/app_colors.dart';
import 'package:pokebook/features/pokemon/data/models/pokemon.dart';
import 'package:pokebook/features/pokemon/presensation/blocs/tab_item_cubit/nav_item_cubit.dart';
import 'package:pokebook/features/pokemon/presensation/blocs/tab_item_cubit/tab_item_state.dart';
import 'package:pokebook/features/pokemon/presensation/widgets/about_tab.dart';
import 'package:pokebook/features/pokemon/presensation/widgets/pokemon_type.dart';
import 'package:pokebook/features/pokemon/presensation/widgets/similar_tab.dart';
import 'package:pokebook/features/pokemon/presensation/widgets/stats_tab.dart';
import 'package:pokebook/features/pokemon/presensation/widgets/tab_bar.dart';

class PokemonDetailsPage extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailsPage(this.pokemon, {super.key});

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.only(left: 8, top: 8),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              )),
        ),
        backgroundColor: AppColors.lightGreen,
      ),
      body: BlocProvider(
        create: (context) => TabItemCubit(),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        decoration: const BoxDecoration(
                            color: AppColors.lightGreen,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30))),
                      ),
                      Positioned(
                        height: 240,
                        left: 90,
                        top: 0,
                        child: Image.network(
                          widget.pokemon.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                  const Gap(16),
                  Text(
                    widget.pokemon.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 36),
                  ),
                  const Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PokemonTypeWidget(text: widget.pokemon.types[0]),
                      const Gap(20),
                      if (widget.pokemon.types.length > 1)
                        PokemonTypeWidget(text: widget.pokemon.types[1]),
                    ],
                  ),
                  const Gap(12),
                  BlocListener<TabItemCubit, TabItemState>(
                    listener: (context, state) {},
                    child: BlocBuilder<TabItemCubit, TabItemState>(
                      builder: (context, state) {
                        return IndexedStack(
                          index: state.currentIndex,
                          children: [
                            AboutTab(pokemon: widget.pokemon),
                            StatsTab(pokemon: widget.pokemon),
                            SimilarPokemonTab(pokemon: widget.pokemon),
                          ],
                        );
                      },
                    ),
                  ),
                  const Gap(700),
                ],
              ),
            ),
            const Positioned(
              bottom: 0,
              child: CustomTabBar(),
            ),
          ],
        ),
      ),
    );
  }
}
