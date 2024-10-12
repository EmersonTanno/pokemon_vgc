import 'package:http/http.dart' as http;
import 'package:pokemon_vgc/app/models/pokemon_model.dart';
import 'dart:convert';
import 'package:pokemon_vgc/app/models/pokemon_team_model.dart';
import 'package:pokemon_vgc/main.dart';

class PokemonTeamsService{
  final String url = 'http://localhost:3000/teams';


  Future<List<PokemonTeamModel>> getTeams() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      List<PokemonTeamModel> teams = jsonList
          .map((json) => PokemonTeamModel.fromJson(json))
          .toList();
      return teams;
    } else {
      throw Exception('Failed to load teams');
    }
  }



  Future<List<PokemonTeamModel>> getTeamsByUserId(int userId) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> existingTeams = json.decode(response.body);
      List<PokemonTeamModel> usersTeams = [];

      for (var team in existingTeams) {
        if (team['user_id'] == userId) {
          usersTeams.add(PokemonTeamModel.fromJson(team));
        }
      }

      return usersTeams;
    } else {
      throw Exception('Failed to load teams');
    }
  }

  Future<PokemonTeamModel> getTeamById(int teamId) async {
    final teams = await getTeams();
    for (var team in teams) {
        if (team.id == teamId) {
          return team;
        }
      }
      throw Exception('Failed to find team');
  }

  Future<void> createTeam(String teamName) async {
    List<PokemonTeamModel> teams = await getTeams();
    int id = 0;
    for (var team in teams) {
      id = team.id;
    }

    PokemonModel pokemon = PokemonModel(
      name: '-',
      lvl: 0,
      nature: '-',
      ability: '-',
      hp: 0,
      atk: 0,
      def: 0,
      spa: 0,
      spd: 0,
      spe: 0,
      image: '-',
      move1: '-',
      move2: '-',
      move3: '-',
      move4: '-'
    );
    
    var response = await http.post(Uri.parse(url),
      body: jsonEncode({"id": id+1, "user_id": loggedUser, "team_name": teamName, "pokemon1": pokemon, "pokemon2": pokemon, "pokemon3": pokemon, "pokemon4": pokemon, "pokemon5": pokemon, "pokemon6": pokemon}));
    if (response.statusCode == 201){
      print('Team created successfully');
    } else {
      throw Exception('Failed to create team');
    }
  }

  
}