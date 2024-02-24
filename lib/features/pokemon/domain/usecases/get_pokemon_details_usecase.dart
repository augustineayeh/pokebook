import '../../data/models/pokemon.dart';
import '../../data/repositories/pokemon_repository_impl.dart';

class GetPokemonDetailsUseCase {
  final PokemonRepository repository;

  GetPokemonDetailsUseCase(this.repository);

  Future<Pokemon> execute(String name) {
    return repository.fetchPokemonDetails(name);
  }
}
