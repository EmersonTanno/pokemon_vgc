import 'package:pokemon_vgc/app/models/pokemon_team_model.dart';

class UserModel {
  final String name;
  final String email;
  final String password;
  List<PokemonTeamModel> teams = []; 

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    this.teams = const [], 
  });
}