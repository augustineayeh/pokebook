import '../models/pokemon.dart';

abstract class PokemonRemoteDataSource {
  Future<List<Pokemon>> fetchPokemonList();

  Future<Pokemon> fetchPokemonDetails(String name);

  Future<List<String>> fetchPokemonTypes(String name);

  Future<List<Pokemon>> fetchSimilarPokemon(String name);
}
