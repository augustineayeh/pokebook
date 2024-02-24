// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pokebook/core/api_client/api_consts.dart';

class Pokemon {
  final String name;
  final String imageUrl;
  final String id;
  final int height;
  final int weight;
  final List<String> abilities;
  final List<String> types;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  Pokemon({
    required this.name,
    required this.imageUrl,
    required this.id,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.types,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<String> abilities = [];
    for (var ability in json['abilities']) {
      abilities.add(ability['ability']['name']);
    }

    List<String> types = [];
    for (var type in json['types']) {
      types.add(type['type']['name']);
    }

    return Pokemon(
      name: json['name'],
      imageUrl: '${ApiConsts.imagesUrl}${json['id']}.png',
      id: json['id'].toString(),
      height: json['height'],
      weight: json['weight'],
      abilities: abilities,
      types: types,
      hp: json['stats'][0]['base_stat'],
      attack: json['stats'][1]['base_stat'],
      defense: json['stats'][2]['base_stat'],
      specialAttack: json['stats'][3]['base_stat'],
      specialDefense: json['stats'][4]['base_stat'],
      speed: json['stats'][5]['base_stat'],
    );
  }
}
