import '../../data/models/pokemon.dart';
import '../../data/repositories/pokemon_repository_impl.dart';

class GetPokemonListUseCase {
  final PokemonRepository repository;

  GetPokemonListUseCase(this.repository);

  Future<List<Pokemon>> execute() {
    return repository.fetchPokemonList();
  }
}
