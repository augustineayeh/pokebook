// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:pokebook/features/pokemon/data/models/pokemon.dart';
import 'package:pokebook/features/pokemon/domain/usecases/get_pokemon_list_usecase.dart';

class PokemonImage extends StatefulWidget {
  final GetPokemonListUseCase getPokemonListUseCase;
  final double scale;

  const PokemonImage({
    Key? key,
    required this.getPokemonListUseCase,
    required this.scale,
  }) : super(key: key);

  @override
  _PokemonImageState createState() => _PokemonImageState();
}

class _PokemonImageState extends State<PokemonImage> {
  late Future<List<Pokemon>> _pokemonListFuture;

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = widget.getPokemonListUseCase.execute();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
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
          return Stack(clipBehavior: Clip.none, children: [
            Container(),
            Center(
              child: SizedBox(
                height: 50 * widget.scale,
                child: Image.network(
                  pokemonList[2].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 0,
              child: SizedBox(
                height: 30 * widget.scale,
                child: Image.network(
                  pokemonList[4].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 10,
              child: SizedBox(
                height: 30 * widget.scale,
                child: Image.network(
                  pokemonList[5].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ]);
        }
      },
    );
  }
}
