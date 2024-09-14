import 'package:pokemon_vgc/app/models/pokemon_model.dart';

class PokemonTeamModel {
  final int team_id;
  final String team_name;
  final PokemonModel pokemon1;
  final PokemonModel pokemon2;
  final PokemonModel pokemon3;
  final PokemonModel pokemon4;
  final PokemonModel pokemon5;
  final PokemonModel pokemon6;

  PokemonTeamModel(
    this.team_id,
    this.team_name,
    this.pokemon1,
    this.pokemon2,
    this.pokemon3,
    this.pokemon4,
    this.pokemon5,
    this.pokemon6,
  );

  // Método toJson para serializar o time em JSON
  Map<String, dynamic> toJson() {
    return {
      'team_id': team_id,
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
      json['team_id'],
      json['team_name'],
      PokemonModel.fromJson(json['pokemon1']),
      PokemonModel.fromJson(json['pokemon2']),
      PokemonModel.fromJson(json['pokemon3']),
      PokemonModel.fromJson(json['pokemon4']),
      PokemonModel.fromJson(json['pokemon5']),
      PokemonModel.fromJson(json['pokemon6']),
    );
  }
}
