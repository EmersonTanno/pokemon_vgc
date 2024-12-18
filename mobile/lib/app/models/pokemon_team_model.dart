import 'package:pokemon_vgc/app/models/pokemon_model.dart';

class PokemonTeamModel {
  final int id;
  final int user_id;
  final String team_name;
  PokemonModel pokemon1;
  PokemonModel pokemon2;
  PokemonModel pokemon3;
  PokemonModel pokemon4;
  PokemonModel pokemon5;
  PokemonModel pokemon6;

  PokemonTeamModel({
    required this.id,
    required this.user_id,
    required this.team_name,
    required this.pokemon1,
    required this.pokemon2,
    required this.pokemon3,
    required this.pokemon4,
    required this.pokemon5,
    required this.pokemon6,
  });

  // Método toJson para serializar o time em JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': user_id,
      'team_name': team_name,
      'pokemon1': pokemon1.toJson(),
      'pokemon2': pokemon2.toJson(),
      'pokemon3': pokemon3.toJson(),
      'pokemon4': pokemon4.toJson(),
      'pokemon5': pokemon5.toJson(),
      'pokemon6': pokemon6.toJson(),
    };
  }

  // Método fromJson para desserializar o time de JSON
  factory PokemonTeamModel.fromJson(Map<String, dynamic> json) {
    return PokemonTeamModel(
      id: int.parse(json['id']), 
      user_id: int.parse(json['user_id']), 
      team_name: json['team_name'],
      pokemon1: PokemonModel.fromJson(json['pokemon1']),
      pokemon2: PokemonModel.fromJson(json['pokemon2']),
      pokemon3: PokemonModel.fromJson(json['pokemon3']),
      pokemon4: PokemonModel.fromJson(json['pokemon4']),
      pokemon5: PokemonModel.fromJson(json['pokemon5']),
      pokemon6: PokemonModel.fromJson(json['pokemon6']),
    );
  }
}
