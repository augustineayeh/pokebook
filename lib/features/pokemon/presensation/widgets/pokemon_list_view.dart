import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pokebook/core/constants/app_colors.dart';
import 'package:pokebook/features/pokemon/presensation/blocs/theme_cubit/theme_cubit.dart';

import '../../data/models/pokemon.dart';
import '../../domain/usecases/get_pokemon_list_usecase.dart';
import '../pages/pokemon_details.dart';
import 'pokemon_type.dart';

class PokemonListView extends StatefulWidget {
  final GetPokemonListUseCase getPokemonListUseCase;

  const PokemonListView({super.key, required this.getPokemonListUseCase});

  @override
  _PokemonListViewState createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  late Future<List<Pokemon>> _pokemonListFuture;
  String _filterText = ' ';
  bool hideTextButton = false;

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = widget.getPokemonListUseCase.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return TextField(
              onChanged: (value) {
                setState(() {
                  _filterText = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: state.themeColor, width: 5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: state.themeColor, width: 5)),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: state.themeColor,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
                contentPadding: const EdgeInsets.all(20),
                hintText: 'Enter pokemon name',
              ),
            );
          },
        ),
        const Gap(8),
        if (!hideTextButton)
          TextButton(
            onPressed: () {
              setState(() {
                _filterText = '';
                hideTextButton = true;
              });
            },
            child: const Text('View all',
                style: TextStyle(
                    decoration: TextDecoration.underline, color: Colors.black)),
          ),
        const Gap(8),
        FutureBuilder<List<Pokemon>>(
          future: _pokemonListFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 100),
                child: CupertinoActivityIndicator(),
              ));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final pokemonList = snapshot.data!;
              final filteredPokemonList = _filterText.isEmpty
                  ? pokemonList
                  : pokemonList
                      .where((pokemon) =>
                          pokemon.name.toLowerCase().contains(_filterText))
                      .toList();
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: filteredPokemonList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PokemonDetailsPage(filteredPokemonList[index])),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
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
                                    filteredPokemonList[index].imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PokemonTypeWidget(
                                  text: filteredPokemonList[index].types[0]),
                              const Gap(40),
                              if (filteredPokemonList[index].types.length > 1)
                                PokemonTypeWidget(
                                    text: filteredPokemonList[index].types[1]),
                            ],
                          ),
                          const Gap(24),
                          Text(
                            filteredPokemonList[index].name,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const Gap(24),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
