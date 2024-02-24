import '../datasources/pokemon_remote_data_source.dart';
import '../models/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> fetchPokemonList();
  Future<Pokemon> fetchPokemonDetails(String name);
}

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Pokemon>> fetchPokemonList() async {
    return remoteDataSource.fetchPokemonList();
  }

  @override
  Future<Pokemon> fetchPokemonDetails(String name) async {
    return remoteDataSource.fetchPokemonDetails(name);
  }
}
