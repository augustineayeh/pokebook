import 'dart:convert';

import 'package:pokebook/core/api_client/api_client.dart';
import 'package:pokebook/core/api_client/api_consts.dart';

import '../models/pokemon.dart';
import 'pokemon_remote_data_source.dart';

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final ApiClient _apiClient;

  PokemonRemoteDataSourceImpl({required ApiClient apiClient})
      : _apiClient = apiClient;

  @override
  Future<List<Pokemon>> fetchPokemonList() async {
    final response = await _apiClient.get(endpoint: ApiConsts.pokemonEndpoint);

    final data = json.decode(response.body)['results'] as List<dynamic>;
    return Future.wait(
        data.map((json) => fetchPokemonDetails(json['name'])).toList());
  }

  @override
  Future<Pokemon> fetchPokemonDetails(String name) async {
    final response = await _apiClient.get(
      endpoint: ApiConsts.pokemonEndpoint,
      path: '/$name',
    );

    return Pokemon.fromJson(json.decode(response.body));
  }

  @override
  Future<List<String>> fetchPokemonTypes(String name) async {
    final response = await _apiClient.get(
      endpoint: ApiConsts.pokemonEndpoint,
      path: '/$name',
    );

    final data = json.decode(response.body)['types'] as List<dynamic>;
    return data.map((type) => type['type']['name'] as String).toList();
  }

  @override
  Future<List<Pokemon>> fetchSimilarPokemon(String name) async {
    final types = await fetchPokemonTypes(name);

    final response = await _apiClient.get(endpoint: ApiConsts.typesEndpoint);

    final typeData = json.decode(response.body)['results'] as List<dynamic>;
    final typeNames = typeData.map((json) => json['name'] as String).toList();

    final similarPokemonList = <Pokemon>[];
    for (final typeName in typeNames) {
      if (types.contains(typeName)) {
        final typeResponse = await _apiClient.get(
            endpoint: ApiConsts.typesEndpoint, path: '/$typeName');

        final typePokemonData =
            json.decode(typeResponse.body)['pokemon'] as List<dynamic>;
        final typePokemonNames = typePokemonData
            .map((json) => json['pokemon']['name'] as String)
            .toList();
        for (final typePokemonName in typePokemonNames) {
          if (typePokemonName != name) {
            final similarPokemon = await fetchPokemonDetails(typePokemonName);
            similarPokemonList.add(similarPokemon);
          }
        }
      }
    }
    return similarPokemonList;
  }
}
