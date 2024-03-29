import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import 'core/api_client/api_client.dart';
import 'features/pokemon/data/datasources/pokemon_remote_data_source_impl.dart';
import 'features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'features/pokemon/domain/usecases/get_pokemon_list_usecase.dart';
import 'features/pokemon/presensation/blocs/theme_cubit/theme_cubit.dart';
import 'features/pokemon/presensation/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient(client: Client());

    final pokemonDataSource = PokemonRemoteDataSourceImpl(apiClient: apiClient);
    final pokemonRepository = PokemonRepositoryImpl(pokemonDataSource);
    final getPokemonListUseCase = GetPokemonListUseCase(pokemonRepository);

    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: MaterialApp(
        title: 'Pokebook',
        theme: ThemeData(),
        home: HomePage(getPokemonListUseCase: getPokemonListUseCase),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
