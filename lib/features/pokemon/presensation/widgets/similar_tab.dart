import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart';

import '../../../../core/api_client/api_client.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/datasources/pokemon_remote_data_source_impl.dart';
import '../../data/models/pokemon.dart';
import '../pages/pokemon_details.dart';
import 'about_tab.dart';
import 'pokemon_type.dart';
import 'tab_title.dart';

class SimilarPokemonTab extends StatefulWidget {
  final Pokemon pokemon;

  const SimilarPokemonTab({super.key, required this.pokemon});

  @override
  _SimilarPokemonState createState() => _SimilarPokemonState();
}

class _SimilarPokemonState extends State<SimilarPokemonTab> {
  late Future<List<Pokemon>> _similarPokemonFuture;
  final apiClient = ApiClient(client: Client());
  @override
  void initState() {
    super.initState();
    _similarPokemonFuture = PokemonRemoteDataSourceImpl(apiClient: apiClient)
        .fetchSimilarPokemon(widget.pokemon.name);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(36),
        const TabTitleWidget(
          text: 'Similar',
        ),
        const CustomDivider(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          color: const Color(0xfff5f5f5),
          child: FutureBuilder<List<Pokemon>>(
            future: _similarPokemonFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 160),
                  child: CupertinoActivityIndicator(),
                ));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final pokemon = snapshot.data![index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PokemonDetailsPage(pokemon)),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 60),
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
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
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const CustomDivider(),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
