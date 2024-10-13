import 'package:pokemon_vgc/app/models/pokemon_team_model.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final String password;
  List<PokemonTeamModel> teams = [];

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.teams = const [],
  });

  // Converte o UserModel para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'teams': teams.map((team) => team.toJson()).toList(),
    };
  }

  // Cria um UserModel a partir de um JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    int _id = int.parse(json['id'].toString());
    return UserModel(
      id: _id,
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }
}
